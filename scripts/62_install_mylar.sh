#!/bin/sh

echo "----------[START] 62_install_mylar.sh"

sudo docker run -d \
	--name mylar \
	--hostname mylar \
	--network host \
	-v /home/pi/CenterMediaNew/SupportApps/mylar/data:/config \
	-v /home/pi/torrents-download/complete:/downloads \
	-v /home/pi/Comics:/comics \
	-e PGID=1000 \
	-e PUID=1000 \
	-e TZ=America/Sao_Paulo \
	-p 8090:8090 \
	linuxserver/mylar3:latest

echo "----------[ END ] 62_install_mylar.sh"
