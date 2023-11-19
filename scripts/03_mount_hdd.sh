#!/bin/sh

echo "----------[START] 03_mount_hdd.sh"

PI_HOME=/home/pi
PI_USER=pi

echo "---------- Folders"

echo "Create /media/1TB folder"
sudo mkdir /media/1TB
echo "Create /media/2TB folder"
sudo mkdir /media/2TB
echo "Create /media/4TB folder"
sudo mkdir /media/4TB
echo "Create /media/4TBII folder"
sudo mkdir /media/4TBII
echo "Change owner folders"
sudo chown -R $PI_USER:$PI_USER /media
echo "Change permissions folders"
sudo chmod -R 755 /media
echo "Create plexdrive/data"
mkdir -p plexdrive/data

echo "---------- fstab"

echo "backup /etc/fstab"
sudo cp /etc/fstab /etc/fstab.bkp

echo "add lines in fstab file"
sudo cat /configs/fstab.pi >> /etc/fstab

echo "---------- mount"

sleep 3

echo "mount /media/1TB"
sudo mount /media/1TB

sleep 3

echo "mount /media/2TB"
sudo mount /media/2TB

sleep 3

echo "mount /media/4TB"
sudo mount /media/4TB

sleep 3

echo "mount /media/4TBII"
sudo mount /media/4TBII

sleep 3

echo "---------- shortcuts"

mkdir $PI_HOME/digaoflix
echo "Create shortcuts for Comics and Series from 1TB"
ln -s /media/1TB/Comics $PI_HOME/Comics
ln -s /media/1TB/Series $PI_HOME/digaoflix/tv_ongoing

echo "Create shortcuts for SeriesAntigas from 4TB"
ln -s /media/4TB/SeriesAntigas $PI_HOME/digaoflix/tv_old

echo "Create shortcuts for CenterMediaNew, pyload-download and torrents-download from 4TBII"
ln -s /media/4TBII/SeriesStreaming $PI_HOME/digaoflix/on_streaming
ln -s /media/4TBII/CenterMediaNew $PI_HOME/CenterMediaNew
ln -s /media/4TBII/CenterMediaNew/tmp/pyload-download $PI_HOME/pyload-download
ln -s /media/4TBII/CenterMediaNew/tmp/torrents $PI_HOME/torrents-download

echo "---------- wakeup hdd"

echo "copy wakeup_hdd.sh"
cp scripts/wakeup_hdd.sh $PI_HOME/scripts/wakeup_hdd.sh

echo "give executable rights"
chmod +x $PI_HOME/scripts/wakeup_hdd.sh

echo "write out current crontab"
sudo crontab -u $PI_USER -l > pi_cron

echo "echo new cron into cron file"
echo "*/10 * * * * \$HOME/scripts/wakeup_hdd.sh > \$HOME/scripts/wakeup_hdd.log 2>&1" >> pi_cron

echo "install new cron file"
sudo crontab -u $PI_USER pi_cron

echo "remove temp file"
rm pi_cron

echo "----------[ END ] 03_mount_hdd.sh"
