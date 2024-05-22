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

# get all docker container names
containers=$(sudo docker ps -a | awk '{if(NR>1) print $NF}')
host=$(hostname)

# loop through all containers
for container in $containers
do
  echo "Starting Container: $container"
  send_message "[SQL-BAK][AFTER ] Starting Container: $container ..."
  
  docker start $container
  sleep 3
  
  echo ================================
done

send_message "[SQL-BAK][AFTER ] Starting Plex Media Server..."
sudo service plexmediaserver start
