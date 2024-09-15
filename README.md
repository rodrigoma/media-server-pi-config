# Media Server Pi Config


## 1 - Prepare SD Card with OS

Insert a SD Card on your PC/Notebook

Download and execute the last version of [Raspberry Pi Imager](https://www.raspberrypi.com/software/)

Pick the options...
- Raspberry Pi Device = Pick the correct model of your RPi board
- Operating System = Raspberry Pi OS (other) > Raspberry Pi OS Lite (64-bit)
- Storate = Pick your SD Card

Press *Next*

We will made a pre-configs going to *Edit Settings*

on General Tab
- Set hostname: pi.local
- Set username: pi
- Set password: <your password>
- Configure wireless LAN (optional with will use wired internet)
- Set locale settings

Services Tab
- Enable SSH and Use password authentication

Save settings and finish the OS instalation in SD Card.


## 2 - Using SSD (optional)

IR A TRAS DAS CONFIGURAÇOES PARA COPIAR O CONTEUDO DO SDCARD PARA O SSD.


## 3


## Raspberry Pi OS and SSH

Following the steps of 
- [Prepare sdcard with headless Raspberry Pi OS](https://www.funkyton.com/install-plex-media-server-on-raspberry-pi/)
- [How to Turn a Raspberry Pi Into a Plex Media Server](https://www.makeuseof.com/tag/raspberry-pi-plex-media-server/)


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


## Export Variables

Execute the file `/scripts/./export_vars.sh` to configure environment variables that will be used in others scripts.


### Configurations

Before the execution, Export Variables has to be configured.

Execute the file `/scripts/./00_0_configs_geral.sh`.

Execute the file `/scripts/./00_1_copy_scripts.sh`.


## Static IP

Execute the file `/scripts/./01_config_static_ip.sh` to configure a static IP.

NOTE: connection will be lost, new IP will be avaible.


## NO-IP

Execute the file `/scripts/./02_install_noip.sh` to install and configure NO-IP.

NOTE: you must have a [NO-IP](https://www.noip.com/) account.


## Mount External HDD

Execute the file `/scripts/./03_mount_hdd.sh` to configure the mounts of HDDs.

NOTE: HDDs must be connect in Raspberry PI.

## Samba

Execute the file `/scripts/./04_install_samba.sh` to install and configure Samba.


## Plex Media Server

Execute the file `/scripts/./05_install_plex.sh` to install and configure Plex Media Server.

NOTE: Password will be asked.


## Docker

Execute the file `/scripts/./06_0_install_docker.sh` to install and configure Docker.


### Sickchill

Execute the file `/scripts/./06_1_docker_run_sickchill.sh` to install Sickchill container.


### Mylar

Execute the file `/scripts/./06_2_docker_run_mylar.sh` to install Mylar container.


### Transmission

Before the execution, Export Variables has to be configured.

Execute the file `/scripts/./06_3_docker_run_transmission.sh` to install Transmission container.

Open Transmission and set the following script to run after download finish `/config/./runScript.sh`


### PyLoad

Execute the file `/scripts/./06_4_docker_run_pyload.sh` to install PyLoad container.


### Plexdrive

Before the execution, Export Variables has to be configured.

Execute the file `/scripts/./06_5_docker_run_plexdrive.sh` to install Plexdrive container.


### Komga

Execute the file `/scripts/./06_6_docker_run_komga.sh` to install Komga container.


### WizNote

Execute the file `/scripts/./06_7_docker_run_wiznote.sh` to install WizNote container.


### WatchTower

Execute the file `/scripts/./06_8_docker_run_watchtower.sh` to install WatchTower container.


### SqlBak

Before the execution, Export Variables has to be configured.

Execute the file `/scripts/./07_install_sqlbak.sh` to install SqlBak application.

Check the dashboard on your account https://sqlbak.com/dashboard


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

https://sqlbak.com/blog/automatic-backup-of-raspberry-pi-to-any-cloud/

https://stackoverflow.com/questions/9457233/unlimited-bash-history

https://github.com/plexdrive/plexdrive/issues/421

## mac

install brew and sshpass on mac
https://www.cyberciti.biz/faq/how-to-install-sshpass-on-macos-os-x/

executar ansible `ansible-playbook -i inventory.yml main.yml -k`

show infos `ansible-playbook -i inventory.yml infos.yml -k`

check connection `ansible-playbook -i inventory.yml check.yml -k`
