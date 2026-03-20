FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    openvpn \
    chromium \
    chromium-driver \
    dnsutils \
    curl \
    socat \
    iproute2 \
    iptables \
    && rm -rf /var/lib/apt/lists/*

# Cria diretório para configs
RUN mkdir -p /etc/openvpn/configs

# Script de entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 18800

ENTRYPOINT ["/entrypoint.sh"]
