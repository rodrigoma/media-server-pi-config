FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    openvpn \
    chromium \
    curl \
    socat \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

# Cria diretório para configs
RUN mkdir -p /etc/openvpn/configs

# Script de entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 18801

ENTRYPOINT ["/entrypoint.sh"]
