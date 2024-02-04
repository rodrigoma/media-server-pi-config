#!/bin/sh

echo "----------[START] 04_install_samba.sh"

echo "Install Samba"
sudo apt-get install samba samba-common-bin

echo "" && sleep 2

echo "backup /etc/samba/smb.conf"
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bkp

echo "" && sleep 2

echo "Adding HDD on Samba"
sudo bash -c "cat configs/smb.conf.pi >> /etc/samba/smb.conf"

echo "" && sleep 2

echo "Set a password"
sudo smbpasswd -a pi

echo "" && sleep 2

echo "----------[ END ] 04_install_samba.sh"
