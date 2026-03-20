#!/bin/bash
# Entrypoint: conecta VPN, inicia Chromium headless e proxy TCP

set -e

# Gera credentials.txt dinamicamente
if [ -n "$VPN_USER" ] && [ -n "$VPN_PASS" ]; then
    echo "$VPN_USER" > /etc/openvpn/credentials.txt
    echo "$VPN_PASS" >> /etc/openvpn/credentials.txt
    chmod 600 /etc/openvpn/credentials.txt
    echo "Credenciais VPN configuradas"
else
    echo "ERRO: VPN_USER e VPN_PASS devem ser definidos" >&2
    exit 1
fi

# Seleciona arquivo .ovpn — usa VPN_COUNTRY se definido, senão escolhe aleatório
OVPN_DIR="/etc/openvpn/configs"
if [ -n "$VPN_COUNTRY" ]; then
    OVPN_FILE=$(ls ${OVPN_DIR}/${VPN_COUNTRY}*.ovpn 2>/dev/null | head -1)
else
    OVPN_FILE=$(ls ${OVPN_DIR}/*.ovpn | shuf -n 1)
fi

if [ -z "$OVPN_FILE" ]; then
    echo "ERRO: Nenhum arquivo .ovpn encontrado em $OVPN_DIR" >&2
    exit 1
fi

echo "Conectando VPN: $OVPN_FILE"

openvpn --config "$OVPN_FILE" \
        --auth-user-pass /etc/openvpn/credentials.txt \
        --log /tmp/vpn.log \
        --daemon

# Aguarda conexão estabelecer — falha explicitamente se não conectar em 20s
echo "Aguardando VPN conectar..."
VPN_CONNECTED=0
for i in $(seq 1 20); do
    if grep -q "Initialization Sequence Completed" /tmp/vpn.log 2>/dev/null; then
        VPN_CONNECTED=1
        echo "VPN conectada! IP externo:"
        curl -s --max-time 5 https://api.my-ip.io/v2/ip.json | grep -o '"ip":"[^"]*"' | cut -d'"' -f4
        break
    fi
    if grep -q "AUTH_FAILED\|TLS Error" /tmp/vpn.log 2>/dev/null; then
        echo "ERRO: Falha de autenticação VPN" >&2
        exit 1
    fi
    sleep 1
done

if [ "$VPN_CONNECTED" -eq 0 ]; then
    echo "ERRO: VPN não conectou em 20 segundos" >&2
    exit 1
fi

# Garante que tráfego de retorno para a rede local vai pela eth0, não pelo túnel VPN
# Isso permite que o Pi 5 (192.168.10.150) alcance o CDP do container
LOCAL_GW=$(ip route | awk '/default .*eth0/ {print $3; exit}')
if [ -n "$LOCAL_GW" ]; then
    if ip route add 192.168.10.0/24 via "$LOCAL_GW" dev eth0 2>/dev/null; then
        echo "Rota local adicionada"
    else
        echo "AVISO: falha ao adicionar rota local via $LOCAL_GW" >&2
    fi
else
    echo "AVISO: gateway padrão na eth0 não encontrado; rota local não adicionada" >&2
fi

# Inicia Chromium headless — bind em localhost (socat expõe externamente na 18801)
chromium \
  --headless \
  --no-sandbox \
  --disable-gpu \
  --disable-dev-shm-usage \
  --remote-debugging-port=18800 \
  --remote-debugging-address=127.0.0.1 \
  --disable-web-security \
  --remote-allow-origins=* \
  2>/dev/null &

CHROMIUM_PID=$!
echo "Chromium iniciado (PID ${CHROMIUM_PID})"

# Aguarda Chromium iniciar
sleep 3

# Proxy TCP: redireciona 0.0.0.0:18801 -> 127.0.0.1:18800
socat TCP-LISTEN:18801,fork,reuseaddr TCP:127.0.0.1:18800 &
SOCAT_PID=$!
echo "Proxy CDP disponível em :18801 (externo) -> :18800 (Chromium) (PID ${SOCAT_PID})"

# Trata sinais para encerrar processos filho corretamente
shutdown() {
    echo "Recebido sinal, encerrando serviços..."
    kill "${SOCAT_PID}" 2>/dev/null || true
    kill "${CHROMIUM_PID}" 2>/dev/null || true
}
trap 'shutdown' SIGTERM SIGINT

# Mantém container vivo aguardando processos principais
wait "${CHROMIUM_PID}" "${SOCAT_PID}"
