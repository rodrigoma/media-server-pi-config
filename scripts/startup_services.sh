#!/bin/sh

#
# FILE LOCATION: $HOME/scripts/startup_services.sh
#
# TURN EXEC: chmod +x $HOME/scripts/startup_services.sh
#
# sudo crontab -u pi -e
# CRONTAB: @reboot $HOME/scripts/startup_services.sh > $HOME/scripts/startup_services.log 2>&1
#

send_message()
{
    curl -X POST \
        -H 'Content-Type: application/json' \
        -d '{"chat_id": "'$CHAT_ID'", "text": "<code>'"$1"'</code>", "parse_mode": "HTML", "disable_notification": true}' \
        https://api.telegram.org/$TELE_TOKEN/sendMessage
}

echo "$(date)"

sleep 30

#while [ ! -f /media/1TB/wakeup.txt -o ! -f /media/2TB/wakeup.txt -o ! -f /media/4TB/wakeup.txt -o ! -f /media/4TBII/wakeup.txt ]; do
while [ ! -f /media/14TB/wakeup.txt -o ]; do
    echo 'HDDs not mount yet'
    sleep 5
done
sleep 10

send_message "[MOUNTED] HDDs"
sleep 10

hostname -I | send_message "[  IP   ] $(awk '{print $1}')"
sleep 10

###### start first essencial containers
###### after start containers that depends from other containers

# get all docker container labeled sqlbak.start.first=true
start_first=$(docker ps --filter "label=sqlbak.start.first=true" --format "{{.Names}}")
send_message "[STARTED] Starting first containers: $start_first ..."
docker start $start_first

sleep 30

# get all docker container labeled sqlbak.start.first=false
start_later=$(docker ps --filter "label=sqlbak.start.first=false" --format "{{.Names}}")
send_message "[STARTED] Starting later containers: $start_later ..."
docker start $start_later

sleep 5

send_message "[STARTED] Starting Plex Media Server..."
sudo service plexmediaserver start
