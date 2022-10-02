#!/bin/sh

echo "----------[START] 6_install_docker.sh"

# download the install script
curl -fsSL https://get.docker.com -o get-docker.sh

# run the install script
sh get-docker.sh

# add 'pi' user to docker group to allow running containers
sudo usermod -aG docker $(whoami)


echo "----------[ END ] 6_install_docker.sh"
