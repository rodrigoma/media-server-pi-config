#!/bin/sh

echo "----------[START] 03_mount_hdd.sh"

echo "" && sleep 2

echo "---------- Folders"

echo "Create /media/1TB folder"
sudo mkdir /media/1TB

echo "" && sleep 2

echo "Create /media/2TB folder"
sudo mkdir /media/2TB

echo "" && sleep 2

echo "Create /media/4TB folder"
sudo mkdir /media/4TB

echo "" && sleep 2

echo "Create /media/4TBII folder"
sudo mkdir /media/4TBII

echo "" && sleep 2

echo "Change owner folders"
sudo chown -R $LOGNAME:$LOGNAME /media

echo "" && sleep 2

echo "Change permissions folders"
sudo chmod -R 755 /media

echo "" && sleep 2

echo "Create plexdrive/data"
mkdir -p plexdrive/data

echo "" && sleep 2

echo "---------- fstab"

echo "backup /etc/fstab"
sudo cp /etc/fstab /etc/fstab.bkp

echo "" && sleep 2

echo "add lines in fstab file"
sudo cat /configs/fstab.pi >> /etc/fstab

echo "" && sleep 2

echo "reload fstab (login requires)"
systemctl daemon-reload

echo "" && sleep 2

echo "---------- mount"

echo "mount /media/1TB"
sudo mount /media/1TB

echo "" && sleep 2

echo "mount /media/2TB"
sudo mount /media/2TB

echo "" && sleep 2

echo "mount /media/4TB"
sudo mount /media/4TB

echo "" && sleep 2

echo "mount /media/4TBII"
sudo mount /media/4TBII

echo "" && sleep 2

echo "---------- shortcuts"

mkdir $HOME/digaoflix
echo "Create shortcuts for Comics and Series from 1TB"
ln -s /media/1TB/Comics $HOME/Comics
ln -s /media/1TB/Series $HOME/digaoflix/tv_ongoing

echo "" && sleep 2

echo "Create shortcuts for SeriesAntigas from 4TB"
ln -s /media/4TB/SeriesAntigas $HOME/digaoflix/tv_old

echo "" && sleep 2

mkdir $HOME/downloads
echo "Create shortcuts for CenterMediaNew, downloads folders for pyload and torrent from 2TB"
ln -s /media/4TBII/SeriesStreaming $HOME/digaoflix/on_streaming
ln -s /media/2TB/CenterMediaNew $HOME/CenterMediaNew
ln -s /media/2TB/CenterMediaNew/tmp/pyload-download $HOME/downloads/pyload
ln -s /media/2TB/CenterMediaNew/tmp/torrents $HOME/downloads/torrents
ln -s /media/2TB/CenterMediaNew/backup $HOME/backups

echo "" && sleep 2

echo "---------- wakeup hdd"

echo "copy wakeup_hdd.sh"
cp scripts/wakeup_hdd.sh $HOME/scripts/wakeup_hdd.sh

echo "" && sleep 2

echo "give executable rights"
chmod +x $HOME/scripts/wakeup_hdd.sh

echo "" && sleep 2

echo "write out current crontab"
sudo crontab -u $LOGNAME -l > pi_cron

echo "" && sleep 2

echo "echo new cron into cron file"
echo "*/10 * * * * \$HOME/scripts/wakeup_hdd.sh > \$HOME/scripts/wakeup_hdd.log 2>&1" >> pi_cron

echo "" && sleep 2

echo "install new cron file"
sudo crontab -u $LOGNAME pi_cron

echo "" && sleep 2

echo "remove temp file"
rm pi_cron

echo "" && sleep 2

echo "----------[ END ] 03_mount_hdd.sh"
