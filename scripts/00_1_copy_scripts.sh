#!/bin/sh

echo "----------[START] 00_1_configs_geral.sh"

PI_HOME=/home/pi
PI_USER=pi

mkdir $PI_HOME/scripts

echo "---------- Script Export Vars"

echo "copy export_vars.sh"
cp scripts/export_vars.sh $PI_HOME/scripts/export_vars.sh

echo "give executable rights"
chmod +x $PI_HOME/scripts/export_vars.sh

echo "don't forget to configure variables"


echo "---------- Script Startup Services"

echo "copy startup_services.sh"
cp scripts/startup_services.sh $PI_HOME/scripts/startup_services.sh

echo "give executable rights"
chmod +x $PI_HOME/scripts/startup_services.sh

echo "write out current crontab"
sudo crontab -u $PI_USER -l > pi_cron

echo "echo new cron into cron file"
echo "@reboot \$HOME/scripts/startup_services.sh > \$HOME/scripts/startup_services.log 2>&1" >> pi_cron

echo "install new cron file"
sudo crontab -u $PI_USER pi_cron

echo "remove temp file"
rm pi_cron


echo "---------- Script Update Docker Images"

echo "copy update_docker_images.sh"
cp scripts/update_docker_images.sh $PI_HOME/scripts/update_docker_images.sh

echo "copy docker runners shell scripts"
cp scripts/06_*_docker_run*.sh $PI_HOME/scripts

echo "give executable rights"
chmod +x $PI_HOME/scripts/update_docker_images.sh
chmod +x $PI_HOME/scripts/06_*_docker_run*.sh

echo "----------[ END ] 00_1_configs_geral.sh"

echo "Recomend restart using the following command..."
echo "sudo shutdown -r now"