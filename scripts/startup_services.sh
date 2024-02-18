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
        -d '{"chat_id": "'$CHAT_ID'", "text": "'"$1"'", "disable_notification": true}' \
        https://api.telegram.org/$TELE_TOKEN/sendMessage
}

echo "$(date)"

while [ ! -f /media/1TB/wakeup.txt -o ! -f /media/2TB/wakeup.txt -o ! -f /media/4TB/wakeup.txt -o ! -f /media/4TBII/wakeup.txt ]; do
    echo 'HDDs not mount yet'
    sleep 5
done

sleep 10

send_message "[MOUNTED] HDDs"

sleep 10

hostname -I | send_message "[  IP   ] $(awk '{print $1}')"

sleep 10

echo "Start sickchill container"
docker start sickchill
send_message "[STARTED] Sickchill"

sleep 10

echo "Start mylar container"
docker start mylar
send_message "[STARTED] Mylar"

sleep 10

echo "Start transmission container"
docker start transmission
send_message "[STARTED] Transmission"

sleep 10

echo "Start pyload-ng container"
docker start pyload-ng
send_message "[STARTED] Pyload"

sleep 15

echo "Start Plex Media Service"
sudo service plexmediaserver start
send_message "[STARTED] Plex Media Server"
