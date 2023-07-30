#!/bin/sh

#
# FILE LOCATION: $HOME/wakeup_hdd.sh
#
# TURN EXEC: chmod +x $HOME/wakeup_hdd.sh
#
# sudo crontab -u pi -e
# CRONTAB: */10 * * * * $HOME/wakeup_hdd.sh > $HOME/wakeup_hdd.log 2>&1
#

echo date

PATH1TB=/media/1TB/wakeup.txt
if [ -f "$PATH1TB" ]; then
    echo 'WakeUp 1TB' > /media/1TB/wakeup.txt
else
    echo 'HDD 1TB not mount yet'
fi

PATH2TB=/media/2TB/wakeup.txt
if [ -f "$PATH2TB" ]; then
    echo 'WakeUp 2TB' > /media/2TB/wakeup.txt
else
    echo 'HDD 2TB not mount yet'
fi

PATH4TB=/media/4TB/wakeup.txt
if [ -f "$PATH4TB" ]; then
    echo 'WakeUp 4TB' > /media/4TB/wakeup.txt
else
    echo 'HDD 4TB not mount yet'
fi

PATH4TBII=/media/4TBII/wakeup.txt
if [ -f "$PATH4TBII" ]; then
    echo 'WakeUp 4TBII' > /media/4TBII/wakeup.txt
else
    echo 'HDD 4TBII not mount yet'
fi
