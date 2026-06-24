FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o /tmp/sqlbak.deb https://sqlbak.com/download/linux/latest/sqlbak_arm64.deb \
    && apt-get install -y /tmp/sqlbak.deb \
    && rm /tmp/sqlbak.deb

RUN touch /usr/bin/mysql \
    && chown root:root /usr/bin/mysql \
    && chmod +x /usr/bin/mysql

COPY scripts/ /home/pi/scripts/
RUN chmod +x /home/pi/scripts/*.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
