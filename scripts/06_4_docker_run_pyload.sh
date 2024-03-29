#!/bin/sh

echo "----------[START] 06_4_docker_run_pyload.sh"

sudo docker run -d \
	--name pyload-ng \
	--hostname pyload-ng \
	--network host \
	-v /home/pi/CenterMediaNew/SupportApps/pyload/config:/config \
	-v /home/pi/downloads/pyload:/downloads \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-p 8000:8000 \
	lscr.io/linuxserver/pyload-ng:arm64v8-latest

echo "----------[ END ] 06_4_docker_run_pyload.sh"
