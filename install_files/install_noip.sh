#!/bin/sh

echo "----------[START] install_noip.sh"

echo "create noip folder in /home/pi/noip"
cd /home/pi
mkdir noip
cd noip

echo "download last version of noip"
wget https://www.noip.com/client/linux/noip-duc-linux.tar.gz

echo "decompress noip"
tar -zxvf noip-duc-linux.tar.gz

echo "build and install noip"
cd noip-2.1.9-1
sudo make
sudo make install

echo "configure noip to run on the boot"

echo "write out current crontab"
sudo crontab -l > pi_root_cron

echo "echo new cron into cron file"
echo "@reboot /usr/local/bin/noip2" >> pi_root_cron

echo "install new cron file"
sudo crontab pi_root_cron

echo "remove temp file"
rm pi_root_cron

echo "----------[ END ] install_noip.sh"
