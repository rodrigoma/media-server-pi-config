#!/bin/sh

echo "----------[START] 06_1_docker_run_sickchill.sh"

sudo docker run -d \
	--name sickchill \
	--hostname sickchill \
	--network host \
	-v /home/pi/CenterMediaNew/SupportApps/sickchill/data:/config \
	-v /home/pi/downloads/torrents/complete:/downloads \
	-v /home/pi/digaoflix/tv_ongoing:/tv \
	-v /home/pi/digaoflix/tv_old/0Ajustar:/tvAntigas \
	-v /home/pi/digaoflix/on_streaming:/streaming \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-p 8081:8081 \
	lscr.io/linuxserver/sickchill:arm64v8-latest

echo "----------[ END ] 06_1_docker_run_sickchill.sh"
