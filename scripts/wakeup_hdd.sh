#!/bin/sh

#
# FILE LOCATION: $HOME/scripts/wakeup_hdd.sh
#
# TURN EXEC: chmod +x $HOME/scripts/wakeup_hdd.sh
#
# sudo crontab -u pi -e
# CRONTAB: */10 * * * * $HOME/scripts/wakeup_hdd.sh > $HOME/scripts/wakeup_hdd.log 2>&1
#

send_message()
{
    curl -X POST \
        -H 'Content-Type: application/json' \
        -d '{"chat_id": "'$CHAT_ID'", "text": "'"$1"'", "disable_notification": true}' \
        https://api.telegram.org/$TELE_TOKEN/sendMessage
}

echo "$(date)"

PATH1TB=/media/1TB/wakeup.txt
if [ -f "$PATH1TB" ]; then
    echo 'WakeUp 1TB' > /media/1TB/wakeup.txt || (send_message "[1TB] DigaoFlix sera reiniciado!" ; sleep 10 ; sudo shutdown -r)
else
    echo 'HDD 1TB not mount yet'
fi

PATH2TB=/media/2TB/wakeup.txt
if [ -f "$PATH2TB" ]; then
    echo 'WakeUp 2TB' > /media/2TB/wakeup.txt || (send_message "[2TB] DigaoFlix sera reiniciado!" ; sleep 10 ; sudo shutdown -r)
else
    echo 'HDD 2TB not mount yet'
fi

PATH4TB=/media/4TB/wakeup.txt
if [ -f "$PATH4TB" ]; then
    echo 'WakeUp 4TB' > /media/4TB/wakeup.txt || (send_message "[4TB] DigaoFlix sera reiniciado!" ; sleep 10 ; sudo shutdown -r)
else
    echo 'HDD 4TB not mount yet'
fi

PATH4TBII=/media/4TBII/wakeup.txt
if [ -f "$PATH4TBII" ]; then
    echo 'WakeUp 4TBII' > /media/4TBII/wakeup.txt || (send_message "[4TBII] DigaoFlix sera reiniciado!" ; sleep 10 ; sudo shutdown -r)
else
    echo 'HDD 4TBII not mount yet'
fi
