#!/bin/sh

echo "----------[START] 06_5_docker_run_plexdrive.sh"

sudo docker run -d \
	--name plexdrive \
	--hostname plexdrive \
	--network host \
	--cap-add SYS_ADMIN \
	--device /dev/fuse \
	--security-opt apparmor=unconfined \
	-v /home/pi/CenterMediaNew/SupportApps/plexdrive/config:/config \
	-v /home/pi/plexdrive/data:/data:shared \
	-e PUID=1000 \
	-e PGID="1000 --root-node-id $GOOGLE_DRIVE_FOLDER_ID " \
	-e TZ=America/Sao_Paulo \
	wiserain/plexdrive:latest

echo "----------[ END ] 06_5_docker_run_plexdrive.sh"
