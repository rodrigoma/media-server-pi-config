#!/bin/sh

echo "----------[START] 00_0_configs_geral.sh"

echo "add ll alias"
sed -i 's/#*alias ll=.*$/alias ll="ls -ahl"/g' ~/.bashrc

source ~/.bashrc

echo "Make sure Raspbian OS can use the entire SD card."
sudo raspi-config --expand-rootfs

echo "Permanently enable SSH server"
sudo systemctl enable ssh
sudo systemctl start ssh

echo "change ssh port"
sudo sed -i 's/^#*Port .*/Port $SSH_PORT/' /etc/ssh/sshd_config

echo "Enable automatic upgrades"
sudo touch /etc/cron.weekly/autoupdate && sudo chmod 755 /etc/cron.weekly/autoupdate && sudo nano /etc/cron.weekly/autoupdate

echo "----------[ END ] 00_0_configs_geral.sh"