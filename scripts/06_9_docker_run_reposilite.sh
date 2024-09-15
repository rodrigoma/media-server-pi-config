#!/bin/sh

echo "----------[START] 06_9_docker_run_reposilite.sh"

sudo docker run -d \
	--name reposilite \
	--hostname reposilite \
	--network host \
	-v /home/pi/centerMedia/SupportApps/reposilite:/app/data \
	-e REPOSILITE_OPTS="--port 9999" \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-p 9999:9999 \
	dzikoysk/reposilite:latest

echo "----------[ END ] 06_9_docker_run_reposilite.sh"
