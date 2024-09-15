#!/bin/sh

#
# FILE LOCATION: $HOME/scripts/sql-backup_after-script_start-services.sh
#
# TURN EXEC: chmod +x $HOME/scripts/sql-backup_after-script.sh
#
# To be used in https://sqlbak.com in AFTER SCRIPT session
#
# loop through all containers source: https://gist.github.com/robsonke/c5c478bae476adb32d48
#

send_message()
{
    curl -X POST \
        -H 'Content-Type: application/json' \
        -d '{"chat_id": "'$CHAT_ID'", "text": "<code>'"$1"'</code>", "parse_mode": "HTML", "disable_notification": true}' \
        https://api.telegram.org/$TELE_TOKEN/sendMessage
}

send_message "[SQL-BAK][AFTER ] Start services..."

###### start first essencial containers
###### after start containers that depends from other containers

# get all docker container labeled sqlbak.start.first=true
start_first=$(docker ps --filter "label=sqlbak.start.first=true" --format "{{.Names}}")
send_message "[SQL-BAK][AFTER ] Starting first containers: $start_first ..."
docker start $start_first

sleep 30

# get all docker container labeled sqlbak.start.first=false
start_later=$(docker ps --filter "label=sqlbak.start.first=false" --format "{{.Names}}")
send_message "[SQL-BAK][AFTER ] Starting later containers: $start_later ..."
docker start $start_later

sleep 5

send_message "[SQL-BAK][AFTER ] Starting Plex Media Server..."
sudo service plexmediaserver start
