#!/bin/sh

#
# FILE LOCATION: $HOME/startup_services.sh
#
# TURN EXEC: chmod +x $HOME/startup_services.sh
#
# sudo crontab -u pi -e
# CRONTAB: @reboot $HOME/startup_services.sh > $HOME/startup_services.log 2>&1
#

echo date

while [ ! -f /media/1TB/wakeup.txt -o ! -f /media/4TB/wakeup.txt -o ! -f /media/4TBII/wakeup.txt ]; do
    echo 'HDDs not mount yet'
    sleep 5
done

echo "Start sickchill container"
docker start sickchill

sleep 5

echo "Start mylar container"
docker start mylar

sleep 5

echo "Start transmission container"
docker start transmission

sleep 5

echo "Start pyload-ng container"
docker start pyload-ng

sleep 15

echo "Start Plex Media Service"
sudo service plexmediaserver start