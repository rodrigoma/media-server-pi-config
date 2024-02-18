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
        -d '{"chat_id": "'$CHAT_ID'", "text": "'"$1"'", "disable_notification": true}' \
        https://api.telegram.org/$TELE_TOKEN/sendMessage
}

send_message "[SQL-BAK][BEFORE] Backup process started..."

# get all docker container names
containers=$(sudo docker ps -a | awk '{if(NR>1) print $NF}')

# Stop all docker containers
send_message "[SQL-BAK][BEFORE] Stoping containers: $containers ..."
docker stop $containers

# Stop plex
send_message "[SQL-BAK][BEFORE] Stoping Plex Media Server..."
sudo service plexmediaserver stop

sleep 5

send_message "[SQL-BAK][BEFORE] Backuping some files..."
dpkg --get-selections > $HOME/backups/rasp_pi/Package.list
sudo cp -R /etc/apt/sources.list* $HOME/backups/rasp_pi/
sudo apt-key exportall > $HOME/backups/rasp_pi/Repo.keys

send_message "[SQL-BAK] Backup will be start..."
