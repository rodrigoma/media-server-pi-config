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

# get all docker container names
containers=$(sudo docker ps -a | awk '{if(NR>1) print $NF}')
host=$(hostname)

# loop through all containers
for container in $containers
do
  echo "Start Container: $container"
  
  docker start $container
  sleep 3
  
  echo ================================
done

sudo service plexmediaserver start
