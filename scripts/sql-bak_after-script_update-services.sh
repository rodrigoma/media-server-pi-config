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

echo "[SQL-BAK][AFTER ] Check apt update..."
sudo apt update

listuptd=""
for pkg in $(apt list --upgradable 2>/dev/null | awk -F/ 'NR>1 {print $1}'); do
  listuptd="$listuptd\n- $pkg"
done

#curl http://192.168.10.100:9000/notify/465a67f962121ed2e5f0e6b55c3a75292903c1dbd5ba9bb5d0a85f0aa27ee6d2 \
#  -H "Content-Type: application/json" \
#  -d '{ "title":"[SQL-BAK][AFTER ] Apps to update", "body":"'"execute manually: $listuptd"'"}'

sleep 3

## TODO create script to update all upgradable apt list, included docker service, because all containers are stopped.

echo "[SQL-BAK][AFTER ] Updating Plex Media Server..."
sudo apt -y install plexmediaserver
sleep 3
