#!/bin/sh

echo "----------[START] 7_configs_geral.sh"

echo "add ll alias"
sed -i 's/#*alias ll=.*$/alias ll="ls -ahl"/g' ~/.bashrc

echo "Make sure Raspbian OS can use the entire SD card."
sudo raspi-config --expand-rootfs

echo "Permanently enable SSH server"
sudo systemctl enable ssh
sudo systemctl start ssh

echo "change ssh port"
sudo sed -i 's/^#*Port .*/Port <YOUR_PORT>/' /etc/ssh/sshd_config

echo "Enable automatic upgrades"
sudo touch /etc/cron.weekly/autoupdate && sudo chmod 755 /etc/cron.weekly/autoupdate && sudo nano /etc/cron.weekly/autoupdate

echo "---------- Startup Services"

PI_HOME=/home/pi
PI_USER=pi

echo "copy startup_services.sh"
cp scripts/startup_services.sh $PI_HOME/startup_services.sh

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

echo "----------[ END ] 7_configs_geral.sh"

echo "Recomend restart using the following command..."
echo "sudo shutdown -r now"