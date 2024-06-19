#!/bin/sh

#
# FILE LOCATION: $HOME/scripts/sql-bak_after-script_update-services.sh
#
# TURN EXEC: chmod +x $HOME/scripts/sql-bak_after-script_update-services.sh
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

send_message "[SQL-BAK][AFTER ] Check apt update..."
sudo apt update

listuptd=$(sudo apt list --upgradable | awk '{if(NR>1) print $1}')

send_message "[SQL-BAK][AFTER ] Apps to update, execute manually: $listuptd"
sleep 3

send_message "[SQL-BAK][AFTER ] Updating Plex Media Server..."
sudo apt -y install plexmediaserver
sleep 3

# get all docker container names excluding plexdrive
# containers=$(docker -a ps --format "{{.Names}}" | grep -v "plexdrive")
# host=$(hostname)

# loop through all containers
# for container in $containers
# do
 #  echo "Updating Container: $container"
  # send_message "[SQL-BAK][AFTER ] Updating Container: $container ..."
  
  # $HOME/scripts/./update_docker_images.sh $container
  # sleep 3
  
  # echo ================================
# done
