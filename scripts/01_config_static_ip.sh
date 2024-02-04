#!/bin/sh

echo "----------[START] 01_config_static_ip.sh"

echo "backup dhcpcd.conf"
sudo cp /etc/dhcpcd.conf /etc/dhcpcd.conf.bkp

echo "add lines in dhcpcd.conf"
sudo cat configs/dhcpcd.conf.pi >> /etc/dhcpcd.conf

echo "backup /etc/network/interfaces"
sudo cp /etc/network/interfaces /etc/network/interfaces.bkp

echo "copy new interfaces file"
sudo sed 's/<WIFI-SSID>/'"$WIFI_SSID"'/;s/<WIFI-PASS>/'"$WIFI_PASS"'/' configs/interfaces.pi > /etc/network/interfaces

echo "reload configs [NOTE: connection will be lost, new IP will be avaible]"
sudo nohup sh -c 'ip addr flush dev eth0 && systemctl restart dhcpcd.service' > /dev/null &

echo "----------[ END ] 01_config_static_ip.sh"
