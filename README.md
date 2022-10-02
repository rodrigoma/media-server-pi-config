# Media Server Pi Config

Instalation of..
- [Raspberry Pi OS](#raspberry-pi-os-and-ssh)
- [SSH](#raspberry-pi-os-and-ssh)
- [GIT](#git)
- [Samba](#samba)
- [NO-IP](#no-ip)
- [Mount External HDD](#mount-external-hdd)
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
sudo apt install git
git config --global core.autocrlf input
git clone https://github.com/rodrigoma/media-server-pi-config.git
```

## Samba

## NO-IP

Execute the file `./install_files/install_noip.sh` to configure NO-IP

NOTE: you must have an account of [NO-IP](https://www.noip.com/)

## Mount External HDD

## Plex Media Server

Disable Plex Media Server to run on startup

`systemctl disable plexmediaserver`

## Docker

## Sickchill

### Mylar

### Transmission

Script to run after download finish

`/config/./runScript.sh`

### PyLoad


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
