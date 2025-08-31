#!/bin/sh

echo "----------[START] 06_10_docker_run_apprise.sh"

sudo docker run -d \
	--name apprise \
	--hostname apprise \
	--label=sqlbak.stop.first=false \
	--label=sqlbak.start.first=true \
	--label=com.centurylinklabs.watchtower.enable=true \
	-v /home/pi/centerMedia/SupportApps/apprise/config:/config \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-p 9000:8000 \
	caronc/apprise:latest

echo "----------[ END ] 06_10_docker_run_apprise.sh"
