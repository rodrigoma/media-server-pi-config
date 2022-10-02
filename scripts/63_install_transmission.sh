#!/bin/sh

echo "----------[START] 63_install_transmission.sh"

sudo docker run -d \
	--name transmission \
	--hostname transmission \
	--network host \
	-v /home/pi/CenterMediaNew/SupportApps/transmission/config:/config \
	-v /home/pi/CenterMediaNew/SupportApps/transmission/watch:/watch \
	-v /home/pi/torrents-download:/downloads \
	-e USER=<YOUR_USER> \
	-e PASS=<YOUR_PASSWORD> \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-e TRANSMISSION_WEB_HOME=/flood-for-transmission/ \
	-p 9091:9091 \
	-p 51413:51413 \
	-p 51413:51413/udp \
	linuxserver/transmission:latest

echo "----------[ END ] 63_install_transmission.sh"
