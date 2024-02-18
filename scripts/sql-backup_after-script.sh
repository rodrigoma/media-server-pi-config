#!/bin/sh

#
# FILE LOCATION: $HOME/scripts/sql-backup_after-script_start-services.sh
#
# TURN EXEC: chmod +x $HOME/scripts/sql-backup_after-script.sh
#
# To be used in https://sqlbak.com in AFTER SCRIPT session
#

docker start pyload-ng
sleep 10

docker start mylar
sleep 10

docker start transmission
sleep 10

docker start sickchill
sleep 10

sudo service plexmediaserver start
