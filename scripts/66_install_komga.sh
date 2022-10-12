#!/bin/sh

echo "----------[START] 66_install_komga.sh"

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

echo "----------[ END ] 66_install_komga.sh"
