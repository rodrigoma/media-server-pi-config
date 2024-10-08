#!/bin/sh

echo "----------[START] 06_1_docker_run_sickchill.sh"

sudo docker run -d \
	--name sickchill \
	--hostname sickchill \
	--network host \
	--label=sqlbak.stop.first=true \
	--label=sqlbak.start.first=false \
	--label=com.centurylinklabs.watchtower.enable=true \
	-v /home/pi/centerMedia/SupportApps/sickchill/data:/config \
	-v /home/pi/downloads/torrents/complete:/downloads \
	-v /home/pi/digaoflix/tv_ongoing:/tv \
	-v /home/pi/digaoflix/tv_old/30min:/tvAntigas30min \
	-v /home/pi/digaoflix/tv_old/60min:/tvAntigas60min \
	-v /home/pi/digaoflix/on_streaming:/streaming \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-p 8081:8081 \
	lscr.io/linuxserver/sickchill:arm64v8-latest

echo "----------[ END ] 06_1_docker_run_sickchill.sh"
