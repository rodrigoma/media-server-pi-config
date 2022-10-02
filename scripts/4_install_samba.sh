#!/bin/sh

echo "----------[START] 4_install_samba.sh"

echo "Install Samba"
sudo apt-get install samba samba-common-bin

echo "backup /etc/samba/smb.conf"
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bkp

echo "Adding HDD on Samba"
sudo cat configs/smb.conf.pi >> /etc/samba/smb.conf

echo "Set a password"
sudo smbpasswd -a pi

echo "----------[ END ] 4_install_samba.sh"
