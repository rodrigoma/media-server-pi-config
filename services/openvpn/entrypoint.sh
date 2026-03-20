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

# Conecta OpenVPN em foreground temporariamente para aguardar conexão
openvpn --config "$OVPN_FILE" \
        --auth-user-pass /etc/openvpn/credentials.txt \
        --log /tmp/vpn.log \
        --daemon

# Aguarda conexão estabelecer
echo "Aguardando VPN conectar..."
for i in $(seq 1 20); do
    if grep -q "Initialization Sequence Completed" /tmp/vpn.log 2>/dev/null; then
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

# Garante que tráfego de retorno para a rede local (192.168.10.0/24) 
# vai pela interface eth0, não pelo túnel VPN
# Isso permite que o Pi 5 (192.168.10.150) alcance o CDP do container
ip route add 192.168.10.0/24 via $(ip route | grep 'default.*eth0' | awk '{print $3}') dev eth0 2>/dev/null || true
echo "Rota local adicionada"

# Inicia Chromium headless em background
chromium \
  --headless \
  --no-sandbox \
  --disable-gpu \
  --disable-dev-shm-usage \
  --remote-debugging-port=18800 \
  --remote-debugging-address=0.0.0.0 \
  --disable-web-security \
  --remote-allow-origins=* \
  2>/dev/null &

echo "Chromium iniciado (PID $!)"

# Aguarda Chromium iniciar
sleep 3

# Proxy TCP: redireciona 0.0.0.0:18801 -> 127.0.0.1:18800
socat TCP-LISTEN:18801,fork,reuseaddr TCP:127.0.0.1:18800 &
echo "Proxy CDP disponível em :18801 (externo) -> :18800 (Chromium)"

# Mantém container vivo
tail -f /dev/null
