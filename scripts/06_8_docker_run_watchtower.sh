#!/bin/sh

echo "----------[START] 06_8_docker_run_watchtower.sh"

sudo docker run -d \
	--name watchtower \
	--hostname watchtower \
	--network host \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-e WATCHTOWER_DEBUG=true \
	-e WATCHTOWER_HTTP_API_UPDATE=true \
	-e WATCHTOWER_HTTP_API_PERIODIC_POLLS=false \
	-e WATCHTOWER_HTTP_API_METRICS=true \
	-e WATCHTOWER_HTTP_API_TOKEN="$TRANSMISSION_PASSWORD" \
	-e WATCHTOWER_CLEANUP=true \
	-e WATCHTOWER_SCHEDULE="0 0 17 * * 5" \
	-e WATCHTOWER_NOTIFICATION_URL="telegram://$TELE_TOKEN_WATCHTOWER@telegram?chats=$CHAT_ID" \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	containrrr/watchtower sickchill mylar transmission pyload-ng komga reposilite

echo "----------[ END ] 06_8_docker_run_watchtower.sh"
