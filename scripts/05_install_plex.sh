#!/bin/sh

echo "----------[START] 05_install_plex.sh"

sudo apt install apt-transport-https -y

echo "" && sleep 2

echo "add the plex signing key and repo"
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo 'deb https://downloads.plex.tv/repo/deb public main' | sudo tee /etc/apt/sources.list.d/plexmediaserver.list

echo "" && sleep 2

echo "Install Plex Media Server"
sudo apt update
sudo apt install plexmediaserver

echo "" && sleep 2

echo "Disable Plex Media Server to run on startup"
systemctl disable plexmediaserver

echo "" && sleep 2

echo "Stop Plex Media Server"
sudo service plexmediaserver stop

echo "" && sleep 2

echo "Coping override.conf for Plex Media Server"
sudo cp configs/override.conf.pi /etc/systemd/system/plexmediaserver.service.d/override.conf

echo "" && sleep 2

echo "Change owner file"
sudo chown root:root /etc/systemd/system/plexmediaserver.service.d/override.conf

echo "" && sleep 2

echo "Change permissions file"
sudo chmod 644 /etc/systemd/system/plexmediaserver.service.d/override.conf

echo "" && sleep 2

echo "----------[ END ] 05_install_plex.sh"
