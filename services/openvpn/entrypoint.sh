#!/bin/bash
# Entrypoint: gera credentials.txt a partir de env vars e inicia Chromium headless

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

# Inicia Chromium headless em background
chromium \
  --headless \
  --no-sandbox \
  --disable-gpu \
  --disable-dev-shm-usage \
  --remote-debugging-port=18800 \
  --remote-debugging-address=0.0.0.0 \
  --disable-web-security \
  2>/dev/null &

echo "Chromium iniciado (PID $!)"
echo "CDP disponível em :18800"

# Mantém container vivo
tail -f /dev/null
