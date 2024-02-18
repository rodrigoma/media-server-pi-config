#!/bin/sh

#
# FILE LOCATION: $HOME/scripts/sql-backup_before-script.sh
#
# TURN EXEC: chmod +x $HOME/scripts/sql-backup_before-script.sh
#
# To be used in https://sqlbak.com in BEFORE SCRIPT session
#

# Stop all docker containers
docker stop $(docker ps -a -q)

# Stop plex
sudo service plexmediaserver stop

sleep 5

dpkg --get-selections > $HOME/backups/rasp_pi/Package.list

sudo cp -R /etc/apt/sources.list* $HOME/backups/rasp_pi/

sudo apt-key exportall > $HOME/backups/rasp_pi/Repo.keys
