#!/bin/sh

echo "----------[START] 06_8_docker_run_watchtower.sh"

sudo docker run -d \
	--name watchtower \
	--hostname watchtower \
	--network host \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	containrrr/watchtower \
	--cleanup \
	--schedule "0 0 17 * * 5" \
	transmission mylar sickchill pyload-ng wiznote komga

echo "----------[ END ] 06_8_docker_run_watchtower.sh"
