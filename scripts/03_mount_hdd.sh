#!/bin/sh

echo "----------[START] 03_mount_hdd.sh"

echo "" && sleep 2

echo "---------- Folders"

# echo "Create /media/1TB folder"
# sudo mkdir /media/1TB

# echo "" && sleep 2

# echo "Create /media/2TB folder"
# sudo mkdir /media/2TB

# echo "" && sleep 2

# echo "Create /media/4TB folder"
# sudo mkdir /media/4TB

# echo "" && sleep 2

# echo "Create /media/4TBII folder"
# sudo mkdir /media/4TBII

# echo "" && sleep 2

echo "Create /media/14TB folder"
sudo mkdir /media/14TB

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

# echo "mount /media/1TB"
# sudo mount /media/1TB

# echo "" && sleep 2

# echo "mount /media/2TB"
# sudo mount /media/2TB

# echo "" && sleep 2

# echo "mount /media/4TB"
# sudo mount /media/4TB

# echo "" && sleep 2

# echo "mount /media/4TBII"
# sudo mount /media/4TBII

# echo "" && sleep 2

echo "mount /media/14TB"
sudo mount /media/14TB

echo "" && sleep 2

echo "---------- shortcuts"

echo "Create shortcuts in digaoflix"
mkdir $HOME/digaoflix
ln -s /media/14TB/videos/series/old $HOME/digaoflix/tv_old
ln -s /media/14TB/videos/series/ongoing $HOME/digaoflix/tv_ongoing
ln -s /media/14TB/videos/series/streaming $HOME/digaoflix/on_streaming

echo "" && sleep 2

echo "Create shortcuts in downloads"
mkdir $HOME/downloads
ln -s /media/14TB/download-mylar $HOME/downloads/mylar
ln -s /media/14TB/download-pyload $HOME/downloads/pyload
ln -s /media/14TB/download-torrent $HOME/downloads/torrents

echo "Create backups shortcut"
ln -s /home/pi/centerMedia/backup $HOME/backups

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
