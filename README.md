# Media Server Pi Config

Instalation/Configuration of..
- [Raspberry Pi OS](#raspberry-pi-os-and-ssh)
- [SSH](#raspberry-pi-os-and-ssh)
- [GIT](#git)
- [Static IP](#static-ip)
- [NO-IP](#no-ip)
- [Mount External HDD](#mount-external-hdd)
- [Samba](#samba)
- [Plex Media Server](#plex-media-server)
- [Docker](#docker)
  - [Sickchill](#sickchill)
  - [Mylar](#mylar)
  - [Transmission](#transmission)
  - [PyLoad](#pyload)


## Raspberry Pi OS and SSH

Following the steps of [˜Prepare sdcard with headless Raspberry Pi OS˜](https://www.funkyton.com/install-plex-media-server-on-raspberry-pi/)

Leaving the Plex installation for a later.

Access `Pi Server` via `ssh -p <PORT> pi@<SERVER_IP>` to execute the follow commands. 


## GIT

Run the commands below to install git to be able to clone this repository.

```
sudo apt update
sudo apt upgrade -y
sudo apt install git
git config --global core.autocrlf input
git clone https://github.com/rodrigoma/media-server-pi-config.git
cd media-server-pi-config
```


## Static IP

Execute the file `/scripts/./1_config_static_ip.sh` to configure a static IP.

NOTE: connection will be lost, new IP will be avaible.


## NO-IP

Execute the file `/scripts/./2_install_noip.sh` to install and configure NO-IP.

NOTE: you must have a [NO-IP](https://www.noip.com/) account.


## Mount External HDD

Execute the file `/scripts/./3_mount_hdd.sh` to configure the mounts of HDDs.

NOTE: HDDs must be connect in Raspberry PI.

## Samba

Execute the file `/scripts/./4_install_samba.sh` to install and configure Samba.


## Plex Media Server

Execute the file `/scripts/./5_install_plex.sh` to install and configure Plex Media Server.

NOTE: Password will be asked.


## Docker

Execute the file `/scripts/./6_install_docker.sh` to install and configure Docker.


## Sickchill

Execute the file `/scripts/./61_install_sickchill.sh` to install Sickchill container.


### Mylar

Execute the file `/scripts/./62_install_mylar.sh` to install Mylar container.


### Transmission

Before the execution, edit the `63_install_transmission.sh` changing both lines with `<YOUR_USER>` and `<YOUR_PASSWORD>`.

Execute the file `/scripts/./63_install_transmission.sh` to install Transmission container.

Open Transmission and set the following script to run after download finish `/config/./runScript.sh`


### PyLoad

Execute the file `/scripts/./64_install_pyload.sh` to install PyLoad container.


### Other configurations

Before the execution, edit the `7_configs_geral.sh` changing `<YOUR_PORT>` for the port you want.

Execute the file `/scripts/./7_configs_geral.sh` to install PyLoad container.


## Sources

https://blog.anoff.io/2020-12-install-docker-raspi/

https://www.funkyton.com/install-plex-media-server-on-raspberry-pi/

https://www.funkyton.com/add-external-hard-disk-to-plex-media-library/

https://www.funkyton.com/local-mass-storage-container-with-raspberry-pi-and-external-hdd/

https://nitinmanju.medium.com/set-up-a-home-media-server-using-a-raspberry-pi-and-plex-666a44f9a3bb

https://www.ionos.com/digitalguide/server/configuration/raspberry-pi-plex/

https://raspberrytips.com/install-no-ip-raspberry-pi/

https://sharechiwai.com/post/2021-02-11-raspberry-pi-how-to-unzip-rar-unrar/

https://b2midia.freshdesk.com/support/solutions/articles/1000266606-configurando-ip-fixo-no-raspberry

https://dausruddin.com/how-to-change-plex-user-running-under-in-ubuntu/

https://unix.stackexchange.com/questions/204641/automatically-mount-a-drive-using-etc-fstab-and-limiting-access-to-all-users-o
