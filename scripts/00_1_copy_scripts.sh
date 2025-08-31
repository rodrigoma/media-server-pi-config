#!/bin/sh

echo "----------[START] 00_1_configs_geral.sh"

echo "create scripts symbolic link"
sudo ln -s $HOME/media-server-pi-config/scripts $HOME/scripts

echo "" && sleep 2

echo "---------- Script Export Vars"

echo "give executable rights"
chmod +x $HOME/scripts/export_vars.sh

echo "" && sleep 2

echo "don't forget to configure variables"

echo "" && sleep 2

echo "---------- Script Startup Services"

echo "give executable rights"
chmod +x $HOME/scripts/startup_services.sh

echo "" && sleep 2

echo "write out current crontab"
sudo crontab -u $LOGNAME -l > pi_cron

echo "" && sleep 2

echo "echo new cron into cron file"
echo "@reboot \$HOME/scripts/startup_services.sh > \$HOME/scripts/startup_services.log 2>&1" >> pi_cron

echo "" && sleep 2

echo "install new cron file"
sudo crontab -u $LOGNAME pi_cron

echo "" && sleep 2

echo "remove temp file"
rm pi_cron

echo "" && sleep 2

echo "---------- Scripts SqlBak"

echo "give executable rights"
chmod +x $HOME/scripts/sql-bak_*.sh

echo "" && sleep 2

echo "----------[ END ] 00_1_configs_geral.sh"

echo "" && sleep 2

echo "Recomend restart using the following command..."
echo "sudo shutdown -r now"
