#!/bin/sh

echo "----------[START] 02_install_noip.sh"

echo "create no-ip folder in /home/pi/noip"
cd /home/pi
mkdir noip
cd noip

echo "" && sleep 2

echo "download last version of no-ip"
wget https://www.noip.com/client/linux/noip-duc-linux.tar.gz

echo "" && sleep 2

echo "decompress no-ip"
tar -zxvf noip-duc-linux.tar.gz

echo "" && sleep 2

echo "build, install and config no-ip "
cd noip-2.1.9-1
sudo make
sudo make install

echo "" && sleep 2

echo "configure no-ip to run on the boot"

echo "" && sleep 2

echo "write out current crontab"
sudo crontab -l > pi_root_cron

echo "" && sleep 2

echo "echo new cron into cron file"
echo "@reboot /usr/local/bin/noip2 -c /usr/local/etc/no-ip2.conf" >> pi_root_cron

echo "" && sleep 2

echo "install new cron file"
sudo crontab pi_root_cron

echo "" && sleep 2

echo "remove temp file"
rm pi_root_cron

echo "" && sleep 2

echo "----------[ END ] 02_install_noip.sh"
