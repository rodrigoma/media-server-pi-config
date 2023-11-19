#!/bin/sh

echo "----------[START] 05_install_plex.sh"

sudo apt install apt-transport-https -y

echo "add the plex signing key and repo"
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo 'deb https://downloads.plex.tv/repo/deb public main' | sudo tee /etc/apt/sources.list.d/plexmediaserver.list

echo "Install Plex Media Server"
sudo apt update
sudo apt install plexmediaserver

echo "Disable Plex Media Server to run on startup"
systemctl disable plexmediaserver

echo "Stop Plex Media Server"
sudo service plexmediaserver stop

echo "Coping override.conf for Plex Media Server"
sudo cp configs/override.conf.pi /etc/systemd/system/plexmediaserver.service.d/override.conf
echo "Change owner file"
sudo chown root:root /etc/systemd/system/plexmediaserver.service.d/override.conf
echo "Change permissions file"
sudo chmod 644 /etc/systemd/system/plexmediaserver.service.d/override.conf

echo "----------[ END ] 05_install_plex.sh"
