#!/bin/sh

#
# FILE LOCATION: $HOME/scripts/sql-backup_before-script.sh
#
# TURN EXEC: chmod +x $HOME/scripts/sql-backup_before-script.sh
#
# To be used in https://sqlbak.com in BEFORE SCRIPT session
#

send_message()
{
    curl -X POST \
        -H 'Content-Type: application/json' \
        -d '{"chat_id": "'$CHAT_ID'", "text": "<code>'"$1"'</code>", "parse_mode": "HTML", "disable_notification": true}' \
        https://api.telegram.org/$TELE_TOKEN/sendMessage
}

send_message "[SQL-BAK][BEFORE] Backup process started..."

###### stop first containers that not depend from other containers
###### after stop essencial containers

# get all docker container labeled sqlbak.stop.first=true
stop_first=$(docker ps -a --filter "label=sqlbak.stop.first=true" --format "{{.Names}}")
send_message "[SQL-BAK][BEFORE] Stoping first containers: $stop_first ..."
docker stop $stop_first

sleep 10

# get all docker container labeled sqlbak.stop.first=false
stop_later=$(docker ps -a --filter "label=sqlbak.stop.first=false" --format "{{.Names}}")
send_message "[SQL-BAK][BEFORE] Stoping later containers: $stop_later ..."
docker stop $stop_later

sleep 5

# Stop plex
send_message "[SQL-BAK][BEFORE] Stoping Plex Media Server..."
sudo service plexmediaserver stop

sleep 5

send_message "[SQL-BAK][BEFORE] Backuping some files..."
dpkg --get-selections > $HOME/backups/rasp_pi/Package.list
sudo cp -R /etc/apt/sources.list* $HOME/backups/rasp_pi/
sudo apt-key exportall > $HOME/backups/rasp_pi/Repo.keys

send_message "[SQL-BAK] Backup will be start..."
