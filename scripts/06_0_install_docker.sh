#!/bin/sh

echo "----------[START] 06_0_install_docker.sh"

# download the install script
curl -fsSL https://get.docker.com -o get-docker.sh

# run the install script
sh get-docker.sh

# add 'pi' user to docker group to allow running containers
sudo usermod -aG docker $(whoami)

echo ""
echo "do you want to run sickchill? yes(y) or no(n)"
read sickchill
case $sickchill in
    y) sh ./06_1_docker_run_sickchill.sh;;
    n) echo "sickchill not installed";;
esac

echo ""
echo "do you want to run mylar? yes(y) or no(n)"
read mylar
case $mylar in
    y) sh ./06_2_docker_run_mylar.sh;;
    n) echo "mylar not installed";;
esac

echo ""
echo "do you want to run transmission? yes(y) or no(n)"
read transmission
case $transmission in
    y) sh ./06_3_docker_run_transmission.sh;;
    n) echo "transmission not installed";;
esac

echo ""
echo "do you want to run pyload? yes(y) or no(n)"
read pyload
case $pyload in
    y) sh ./06_4_docker_run_pyload.sh;;
    n) echo "pyload not installed";;
esac

echo ""
echo "do you want to run plexdrive? yes(y) or no(n)"
read plexdrive
case $plexdrive in
    y) sh ./06_5_docker_run_plexdrive.sh;;
    n) echo "plexdrive not installed";;
esac

echo ""
echo "do you want to run komga? yes(y) or no(n)"
read komga
case $komga in
    y) sh ./06_6_docker_run_komga.sh;;
    n) echo "komga not installed";;
esac

echo "----------[ END ] 06_0_install_docker.sh"
