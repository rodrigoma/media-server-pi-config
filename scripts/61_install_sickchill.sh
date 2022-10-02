#!/bin/sh

echo "----------[START] 61_install_sickchill.sh"

sudo docker run -d \
	--name sickchill \
	--hostname sickchill \
	--network host \
	-v /home/pi/CenterMediaNew/SupportApps/sickchill/data:/config \
	-v /home/pi/torrents-download/complete:/downloads \
	-v /home/pi/Series:/tv \
	-v /home/pi/SeriesAntigas/0Ajustar:/tvAntigas \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-p 8081:8081 \
	linuxserver/sickchill:latest

echo "----------[ END ] 61_install_sickchill.sh"
