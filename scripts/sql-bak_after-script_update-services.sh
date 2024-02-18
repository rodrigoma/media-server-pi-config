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

sudo apt update

sudo apt list --upgradable

sudo apt -y install plexmediaserver
sleep 3

# get all running docker container names
containers=$(sudo docker ps | awk '{if(NR>1) print $NF}')
host=$(hostname)

# loop through all containers
for container in $containers
do
  echo "Update Container: $container"
  
  $HOME/scripts/./update_docker_images.sh $containers
  sleep 3
  
  echo ================================
done
