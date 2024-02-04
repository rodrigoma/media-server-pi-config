#!/bin/sh

echo "----------[START] 06_6_docker_run_komga.sh"

sudo docker run -d \
	--name komga \
	--hostname komga \
	--network host \
	-v /home/pi/CenterMediaNew/SupportApps/komga/config:/config \
	-v /home/pi/plexdrive/data:/data \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-p 8080:8080 \
	gotson/komga

echo "----------[ END ] 06_6_docker_run_komga.sh"
