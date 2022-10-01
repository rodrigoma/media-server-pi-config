#!/bin/sh

##
####
##

PI_HOME=/home/pi
PI_USER=pi

##
####
##

echo "----------[START] Static IP"

echo "backup dhcpcd.conf"
sudo cp /etc/dhcpcd.conf /etc/dhcpcd.conf.bkp

echo "add lines in dhcpcd.conf"
echo "# pi server config"  >> /etc/dhcpcd.conf
echo "interface eth0" >> /etc/dhcpcd.conf
echo "static ip_address=192.168.0.100/24" >> /etc/dhcpcd.conf
echo "static routers=192.168.0.1" >> /etc/dhcpcd.conf
echo "static domain_name_servers=192.168.0.1 8.8.8.8" >> /etc/dhcpcd.conf

echo "reload configs [NOTE: connection will be lost, new IP will be avaible]"
sudo nohup sh -c 'ip addr flush dev eth0 && systemctl restart dhcpcd.service' > /dev/null &

echo "----------[ END ] Static IP"

##
####
##

echo "----------[START] Config fstab"

echo "backup /etc/fstab"
sudo cp /etc/fstab /etc/fstab.bkp

echo "Writing lines..."
sudo echo "UUID=5BFA-041D        /media/1TB      exfat   defaults,auto,rw,uid=1000,gid=1000,umask=022,nofail 0 0" >> /etc/fstab
sudo echo "UUID=6083-157B        /media/4TB      exfat   defaults,auto,rw,uid=1000,gid=1000,umask=022,nofail 0 0" >> /etc/fstab
sudo echo "UUID=61FC-8549        /media/4TBII    exfat   defaults,auto,rw,uid=1000,gid=1000,umask=022,nofail 0 0" >> /etc/fstab

echo "----------[ END ] Config fstab"

##
####
##

echo "----------[START] Mount folders"

echo "Create /media/1TB folder"
sudo mkdir /media/1TB
echo "Create /media/4TB folder"
sudo mkdir /media/4TB
echo "Create /media/4TBII folder"
sudo mkdir /media/4TBII
echo "Change owner folders"
sudo chown -R $PI_USER:$PI_USER /media
echo "Change permissions folders"
sudo chmod -R 755 /media

echo "----------[ END ] Mount folders"

##
####
##

echo "----------[START] Change Plex Media Server folder path"

echo "Coping override.conf for Plex Media Server"
sudo cp override.conf /etc/systemd/system/plexmediaserver.service.d/override.conf
echo "Change owner file"
sudo chown root:root /etc/systemd/system/plexmediaserver.service.d/override.conf
echo "Change permissions file"
sudo chmod 644 /etc/systemd/system/plexmediaserver.service.d/override.conf

echo "----------[ END ] Change Plex Media Server folder path"


##
####
##

echo "----------[START] Shortcuts"

echo "Create shortcuts for Comics and Series from 1TB"
ln -s /media/1TB/Comics $PI_HOME/Comics
ln -s /media/1TB/Series $PI_HOME/Series

echo "Create shortcuts for SeriesAntigas from 4TB"
ln -s /media/4TB/SeriesAntigas $PI_HOME/SeriesAntigas

echo "Create shortcuts for CenterMediaNew, pyload-download and torrents-download from 4TBII"
ln -s /media/4TBII/CenterMediaNew $PI_HOME/CenterMediaNew
ln -s /media/4TBII/CenterMediaNew/tmp/pyload-download $PI_HOME/pyload-download
ln -s /media/4TBII/CenterMediaNew/tmp/torrents $PI_HOME/torrents-download

echo "----------[ END ] Shortcuts"

##
####
##

echo "----------[START] startup_services.sh"
echo "copy startup_services.sh"
cp startup_services.sh $PI_HOME/startup_services.sh

echo "give executable rights"
chmod +x $PI_HOME/startup_services.sh

echo "write out current crontab"
sudo crontab -u $PI_USER -l > pi_cron

echo "echo new cron into cron file"
echo "@reboot \$HOME/startup_services.sh > \$HOME/startup_services.log 2>&1" >> pi_cron

echo "install new cron file"
sudo crontab -u $PI_USER pi_cron

echo "remove temp file"
rm pi_cron
echo "----------[ END ] startup_services.sh"

##
####
##

echo "----------[START] wakeup_hdd.sh"
echo "copy wakeup_hdd.sh"
cp wakeup_hdd.sh $PI_HOME/wakeup_hdd.sh

echo "give executable rights"
chmod +x $PI_HOME/wakeup_hdd.sh

echo "write out current crontab"
sudo crontab -u $PI_USER -l > pi_cron

echo "echo new cron into cron file"
echo "*/10 * * * * \$HOME/wakeup_hdd.sh > \$HOME/wakeup_hdd.log 2>&1" >> pi_cron

echo "install new cron file"
sudo crontab -u $PI_USER pi_cron

echo "remove temp file"
rm pi_cron
echo "----------[ END ] wakeup_hdd.sh"