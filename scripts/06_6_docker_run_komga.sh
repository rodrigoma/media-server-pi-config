#!/bin/sh

echo "----------[START] 06_6_docker_run_komga.sh"

sudo docker run -d \
	--name komga \
	--hostname komga \
	--network host \
	-v /home/pi/centerMedia/SupportApps/komga/config:/config \
	-v /home/pi/plexdrive/data:/data \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-p 25600:25600 \
	gotson/komga:latest

echo "----------[ END ] 06_6_docker_run_komga.sh"
