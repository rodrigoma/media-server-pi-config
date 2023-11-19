#!/bin/sh

echo "----------[START] 06_3_docker_run_transmission.sh"

sudo docker run -d \
	--name transmission \
	--hostname transmission \
	--network host \
	-v /home/pi/CenterMediaNew/SupportApps/transmission/config:/config \
	-v /home/pi/CenterMediaNew/SupportApps/transmission/watch:/watch \
	-v /home/pi/downloads/torrents:/downloads \
	-e USER=$TRANSMISSION_USER \
	-e PASS=$TRANSMISSION_PASSWORD \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-e TRANSMISSION_WEB_HOME=/flood-for-transmission/ \
	-p 9091:9091 \
	-p 51413:51413 \
	-p 51413:51413/udp \
	linuxserver/transmission:latest

echo "----------[ END ] 06_3_docker_run_transmission.sh"
