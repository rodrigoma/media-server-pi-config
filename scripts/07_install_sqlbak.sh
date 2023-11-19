#!/bin/sh

echo "----------[START] 07_install_sqlbak.sh"

echo "download sqlbak_armhf.deb"
curl -o sqlbak.deb https://sqlbak.com/download/linux/latest/sqlbak_armhf.deb

echo "install sqlbak.deb"
sudo apt-get install ./sqlbak.deb 

echo "register the server on sqlbak"
sudo sqlbak -r -k $SQLBAK_TOKEN

echo "create default connection"
sudo sqlbak --add-connection --db-type=mysql --user=root

echo "delete installation files"
rm -rf sqlbak.deb

echo "----------[ END ] 07_install_sqlbak.sh"