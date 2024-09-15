#!/bin/sh

echo "----------[START] 06_2_docker_run_mylar.sh"

sudo docker run -d \
	--name mylar \
	--hostname mylar \
	--network host \
	-v /home/pi/centerMedia/SupportApps/mylar/data:/config \
	-v /home/pi/downloads/torrents/complete:/downloads \
	-v /home/pi/downloads/mylar:/comics \
	-e PGID=1000 \
	-e PUID=1000 \
	-e TZ=America/Sao_Paulo \
	-p 8090:8090 \
	lscr.io/linuxserver/mylar3:arm64v8-latest

echo "----------[ END ] 06_2_docker_run_mylar.sh"
