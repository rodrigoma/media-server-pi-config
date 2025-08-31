#!/bin/sh

echo "----------[START] 06_7_docker_run_wiznote.sh"

sudo docker run -d \
	--name wiznote \
	--hostname wiznote \
	--network host \
	--label=sqlbak.stop.first=true \
	--label=sqlbak.start.first=false \
	--label=com.centurylinklabs.watchtower.enable=true \
	-v /home/pi/centerMedia/SupportApps/wiznote/data:/wiz/storage \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-p 80:80 \
	-p 9269:9269/udp \
	wiznote/wizserver

echo "----------[ END ] 06_7_docker_run_wiznote.sh"
