#!/bin/sh

#
# FILE LOCATION: $HOME/scripts/update_docker_images.sh
#
# TURN EXEC: chmod +x $HOME/scripts/update_docker_images.sh
#

export LANG=C

echo "Start script"

echo "--------------------------------------------"

if [ $1 = "sickchill" ]; then
    echo "[SICKCHILL] Check if has updates..."

    if ! docker pull linuxserver/sickchill | grep "Image is up to date"; then
        echo "[SICKCHILL] Image update, recreating container..."
        echo "[SICKCHILL] Stoping old container..."
        docker stop sickchill
        echo "[SICKCHILL] Removing old container..."
        docker rm sickchill
        echo "[SICKCHILL] Starting new container..."
        sh ./06_1_docker_run_sickchill.sh
        echo "[SICKCHILL] Running new version"
        docker ps -a
    else
        echo "[SICKCHILL] No updates"
    fi
else
    echo "[SICKCHILL] Not to be update today..."
fi

echo "--------------------------------------------"

if [ $1 = "mylar" ]; then
    echo "[MYLAR] Check if has updates..."

    if ! docker pull linuxserver/mylar3 | grep "Image is up to date"; then
        echo "[MYLAR] Image update, recreating container..."
        echo "[MYLAR] Stoping old container..."
        docker stop mylar
        echo "[MYLAR] Removing old container..."
        docker rm mylar
        echo "[MYLAR] Starting new container..."
        sh ./06_2_docker_run_mylar.sh
        echo "[MYLAR] Running new version"
        docker ps -a
    else
        echo "[MYLAR] No updates"
    fi
else
    echo "[MYLAR] Not to be update today..."
fi

echo "--------------------------------------------"

if [ $1 = "transmission" ]; then
    echo "[TRANSMISSION] Check if has updates..."

    if ! docker pull linuxserver/transmission | grep "Image is up to date"; then
        echo "[TRANSMISSION] Image update, recreating container..."
        echo "[TRANSMISSION] Stoping old container..."
        docker stop transmission
        echo "[TRANSMISSION] Removing old container..."
        docker rm transmission
        echo "[TRANSMISSION] Starting new container..."
        sh ./06_3_docker_run_transmission.sh
        echo "[TRANSMISSION] Running new version"
        docker ps -a
    else
        echo "[TRANSMISSION] No updates"
    fi
else
    echo "[TRANSMISSION] Not to be update today..."
fi

echo "--------------------------------------------"

if [ $1 = "pyload-ng" ]; then
    echo "[PYLOAD-NG] Check if has updates..."

    if ! docker pull linuxserver/pyload-ng | grep "Image is up to date"; then
        echo "[PYLOAD-NG] Image update, recreating container..."
        echo "[PYLOAD-NG] Stoping old container..."
        docker stop pyload-ng
        echo "[PYLOAD-NG] Removing old container..."
        docker rm pyload-ng
        echo "[PYLOAD-NG] Starting new container..."
        sh ./06_4_docker_run_pyload.sh
        echo "[PYLOAD-NG] Running new version"
        docker ps -a
    else
        echo "[PYLOAD-NG] No updates"
    fi
else
    echo "[PYLOAD-NG] Not to be update today..."
fi

echo "--------------------------------------------"

docker rmi $(docker images -f "dangling=true" -q)

echo "--------------------------------------------"

docker images --all

echo "--------------------------------------------"

docker ps -a

echo "--------------------------------------------"

echo "Finish script"
exit 1