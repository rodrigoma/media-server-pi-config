#!/bin/bash

#
# FILE LOCATION: $HOME/scripts/export_vars.sh
#
# TURN EXEC: chmod +x $HOME/scripts/export_vars.sh
#

restart=false

variable_name_user_id=USER_ID
if [ -z ${USER_ID+x} ]; then
    echo "$variable_name_user_id is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_user_id:"
    read variable_value_user_id

    echo ""
    echo "adding " $variable_name_user_id " to environment variables..."
    sudo echo "export "$variable_name_user_id"="$variable_value_user_id >> ~/.bashrc
    sudo echo $variable_name_user_id"="$variable_value_user_id >> ~/.profile
    echo $variable_name_user_id"="$variable_value_user_id | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_user_id is already set!";
fi

echo ""
variable_name_group_id=GROUP_ID
if [ -z ${GROUP_ID+x} ]; then
    echo "$variable_name_group_id is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_group_id:"
    read variable_value_group_id

    echo ""
    echo "adding " $variable_name_group_id " to environment variables..."
    sudo echo "export "$variable_name_group_id"="$variable_value_group_id >> ~/.bashrc
    sudo echo $variable_name_group_id"="$variable_value_group_id >> ~/.profile
    echo $variable_name_group_id"="$variable_value_group_id | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_group_id is already set!";
fi

variable_name_chat_id=CHAT_ID
if [ -z ${CHAT_ID+x} ]; then
    echo "$variable_name_chat_id is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_chat_id:"
    read variable_value_chat_id

    echo ""
    echo "adding " $variable_name_chat_id " to environment variables..."
    sudo echo "export "$variable_name_chat_id"="$variable_value_chat_id >> ~/.bashrc
    sudo echo $variable_name_chat_id"="$variable_value_chat_id >> ~/.profile
    echo $variable_name_chat_id"="$variable_value_chat_id | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_chat_id is already set!";
fi

echo ""
variable_name_tele_token=TELE_TOKEN
if [ -z ${TELE_TOKEN+x} ]; then
    echo "$variable_name_tele_token is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_tele_token:"
    read variable_value_tele_token

    echo ""
    echo "adding " $variable_name_tele_token " to environment variables..."
    sudo echo "export "$variable_name_tele_token"="$variable_value_tele_token >> ~/.bashrc
    sudo echo $variable_name_tele_token"="$variable_value_tele_token >> ~/.profile
    echo $variable_name_tele_token"="$variable_value_tele_token | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_tele_token is already set!";
fi

echo ""
variable_name_tele_token_watchtower=TELE_TOKEN_WATCHTOWER
if [ -z ${TELE_TOKEN_WATCHTOWER+x} ]; then
    echo "$variable_name_tele_token_watchtower is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_tele_token_watchtower:"
    read variable_value_tele_token_watchtower

    echo ""
    echo "adding " $variable_name_tele_token_watchtower " to environment variables..."
    sudo echo "export "$variable_name_tele_token_watchtower"="$variable_value_tele_token_watchtower >> ~/.bashrc
    sudo echo $variable_name_tele_token_watchtower"="$variable_value_tele_token_watchtower >> ~/.profile
    echo $variable_name_tele_token_watchtower"="$variable_value_tele_token_watchtower | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_tele_token_watchtower is already set!";
fi

echo ""
variable_name_gdrive_folder_id=GOOGLE_DRIVE_FOLDER_ID
if [ -z ${GOOGLE_DRIVE_FOLDER_ID+x} ]; then
    echo "$variable_name_gdrive_folder_id is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_gdrive_folder_id:"
    read variable_value_gdrive_folder_id

    echo ""
    echo "adding " $variable_name_gdrive_folder_id " to environment variables..."
    sudo echo "export "$variable_name_gdrive_folder_id"="$variable_value_gdrive_folder_id >> ~/.bashrc
    sudo echo $variable_name_gdrive_folder_id"="$variable_value_gdrive_folder_id >> ~/.profile
    echo $variable_name_gdrive_folder_id"="$variable_value_gdrive_folder_id | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_gdrive_folder_id is already set!";
fi

echo ""
variable_name_ssh_port=SSH_PORT
if [ -z ${SSH_PORT+x} ]; then
    echo "$variable_name_ssh_port is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_ssh_port:"
    read variable_value_ssh_port

    echo ""
    echo "adding " $variable_name_ssh_port " to environment variables..."
    sudo echo "export "$variable_name_ssh_port"="$variable_value_ssh_port >> ~/.bashrc
    sudo echo $variable_name_ssh_port"="$variable_value_ssh_port >> ~/.profile
    echo $variable_name_ssh_port"="$variable_value_ssh_port | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_ssh_port is already set!";
fi

echo ""
variable_name_sqlbak_token=SQLBAK_TOKEN
if [ -z ${SQLBAK_TOKEN+x} ]; then
    echo "$variable_name_sqlbak_token is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_sqlbak_token:"
    read variable_value_sqlbak_token

    echo ""
    echo "adding " $variable_name_sqlbak_token " to environment variables..."
    sudo echo "export "$variable_name_sqlbak_token"="$variable_value_sqlbak_token >> ~/.bashrc
    sudo echo $variable_name_sqlbak_token"="$variable_value_sqlbak_token >> ~/.profile
    echo $variable_name_sqlbak_token"="$variable_value_sqlbak_token | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_sqlbak_token is already set!";
fi

echo ""
variable_name_transmission_user=TRANSMISSION_USER
if [ -z ${TRANSMISSION_USER+x} ]; then
    echo "$variable_name_transmission_user is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_transmission_user:"
    read variable_value_transmission_user

    echo ""
    echo "adding " $variable_name_transmission_user " to environment variables..."
    sudo echo "export "$variable_name_transmission_user"="$variable_value_transmission_user >> ~/.bashrc
    sudo echo $variable_name_transmission_user"="$variable_value_transmission_user >> ~/.profile
    echo $variable_name_transmission_user"="$variable_value_transmission_user | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_transmission_user is already set!";
fi

echo ""
variable_name_transmission_password=TRANSMISSION_PASSWORD
if [ -z ${TRANSMISSION_PASSWORD+x} ]; then
    echo "$variable_name_transmission_password is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_transmission_password:"
    read variable_value_transmission_password

    echo ""
    echo "adding " $variable_name_transmission_password " to environment variables..."
    sudo echo "export "$variable_name_transmission_password"="$variable_value_transmission_password >> ~/.bashrc
    sudo echo $variable_name_transmission_password"="$variable_value_transmission_password >> ~/.profile
    echo $variable_name_transmission_password"="$variable_value_transmission_password | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_transmission_password is already set!";
fi

echo ""
variable_name_wifi_ssid=WIFI_SSID
if [ -z ${WIFI_SSID+x} ]; then
    echo "$variable_name_wifi_ssid is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_wifi_ssid:"
    read variable_value_wifi_ssid

    echo ""
    echo "adding " $variable_name_wifi_ssid " to environment variables..."
    sudo echo "export "$variable_name_wifi_ssid"="$variable_value_wifi_ssid >> ~/.bashrc
    sudo echo $variable_name_wifi_ssid"="$variable_value_wifi_ssid >> ~/.profile
    echo $variable_name_wifi_ssid"="$variable_value_wifi_ssid | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_wifi_ssid is already set!";
fi

echo ""
variable_name_duckdns_token=DUCKDNS_TOKEN
if [ -z ${DUCKDNS_TOKEN+x} ]; then
    echo "$variable_name_duckdns_token is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_duckdns_token:"
    read variable_value_duckdns_token

    echo ""
    echo "adding " $variable_name_duckdns_token " to environment variables..."
    sudo echo "export "$variable_name_duckdns_token"="$variable_value_duckdns_token >> ~/.bashrc
    sudo echo $variable_name_duckdns_token"="$variable_value_duckdns_token >> ~/.profile
    echo $variable_name_duckdns_token"="$variable_value_duckdns_token | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_duckdns_token is already set!";
fi

echo ""
variable_name_user_email=USER_EMAIL
if [ -z ${USER_EMAIL+x} ]; then
    echo "$variable_name_user_email is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_user_email:"
    read variable_value_user_email

    echo ""
    echo "adding " $variable_name_user_email " to environment variables..."
    sudo echo "export "$variable_name_user_email"="$variable_value_user_email >> ~/.bashrc
    sudo echo $variable_name_user_email"="$variable_value_user_email >> ~/.profile
    echo $variable_name_user_email"="$variable_value_user_email | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_user_email is already set!";
fi

echo ""
variable_name_traefik_basic_auth=TRAEFIK_BASIC_AUTH
if [ -z ${TRAEFIK_BASIC_AUTH+x} ]; then
    echo "$variable_name_traefik_basic_auth is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_traefik_basic_auth:"
    read variable_value_traefik_basic_auth

    echo ""
    echo "adding " $variable_name_traefik_basic_auth " to environment variables..."
    sudo echo "export "$variable_name_traefik_basic_auth"="$variable_value_traefik_basic_auth >> ~/.bashrc
    sudo echo $variable_name_traefik_basic_auth"="$variable_value_traefik_basic_auth >> ~/.profile
    echo $variable_name_traefik_basic_auth"="$variable_value_traefik_basic_auth | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_traefik_basic_auth is already set!";
fi

echo ""
variable_name_my_domain=MY_DOMAIN
if [ -z ${MY_DOMAIN+x} ]; then
    echo "$variable_name_my_domain is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_my_domain:"
    read variable_value_my_domain

    echo ""
    echo "adding " $variable_name_my_domain " to environment variables..."
    sudo echo "export "$variable_name_my_domain"="$variable_value_my_domain >> ~/.bashrc
    sudo echo $variable_name_my_domain"="$variable_value_my_domain >> ~/.profile
    echo $variable_name_my_domain"="$variable_value_my_domain | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_my_domain is already set!";
fi

echo ""
variable_name_reposilite_port=REPOSILITE_PORT
if [ -z ${REPOSILITE_PORT+x} ]; then
    echo "$variable_name_reposilite_port is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_reposilite_port:"
    read variable_value_reposilite_port

    echo ""
    echo "adding " $variable_name_reposilite_port " to environment variables..."
    sudo echo "export "$variable_name_reposilite_port"="$variable_value_reposilite_port >> ~/.bashrc
    sudo echo $variable_name_reposilite_port"="$variable_value_reposilite_port >> ~/.profile
    echo $variable_name_reposilite_port"="$variable_value_reposilite_port | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_reposilite_port is already set!";
fi

echo ""
variable_name_wifi_pass=WIFI_PASS
if [ -z ${WIFI_PASS+x} ]; then
    echo "$variable_name_wifi_pass is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_wifi_pass:"
    read variable_value_wifi_pass

    echo ""
    echo "adding " $variable_name_wifi_pass " to environment variables..."
    sudo echo "export "$variable_name_wifi_pass"="$variable_value_wifi_pass >> ~/.bashrc
    sudo echo $variable_name_wifi_pass"="$variable_value_wifi_pass >> ~/.profile
    echo $variable_name_wifi_pass"="$variable_value_wifi_pass | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_wifi_pass is already set!";
fi


echo ""
variable_name_media_repo_path=MEDIA_REPO_PATH
if [ -z ${MEDIA_REPO_PATH+x} ]; then
    echo "$variable_name_media_repo_path is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_media_repo_path:"
    read variable_value_media_repo_path

    echo ""
    echo "adding " $variable_name_media_repo_path " to environment variables..."
    sudo echo "export "$variable_name_media_repo_path"="$variable_value_media_repo_path >> ~/.bashrc
    sudo echo $variable_name_media_repo_path"="$variable_value_media_repo_path >> ~/.profile
    echo $variable_name_media_repo_path"="$variable_value_media_repo_path | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_media_repo_path is already set!";
fi

echo ""
variable_name_transmission_server=TRANSMISSION_SERVER
if [ -z ${TRANSMISSION_SERVER+x} ]; then
    echo "$variable_name_transmission_server is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_transmission_server:"
    read variable_value_transmission_server

    echo ""
    echo "adding " $variable_name_transmission_server " to environment variables..."
    sudo echo "export "$variable_name_transmission_server"="$variable_value_transmission_server >> ~/.bashrc
    sudo echo $variable_name_transmission_server"="$variable_value_transmission_server >> ~/.profile
    echo $variable_name_transmission_server"="$variable_value_transmission_server | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_transmission_server is already set!";
fi

echo ""
variable_name_plex_token=PLEX_TOKEN
if [ -z ${PLEX_TOKEN+x} ]; then
    echo "$variable_name_plex_token is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_plex_token:"
    read variable_value_plex_token

    echo ""
    echo "adding " $variable_name_plex_token " to environment variables..."
    sudo echo "export "$variable_name_plex_token"="$variable_value_plex_token >> ~/.bashrc
    sudo echo $variable_name_plex_token"="$variable_value_plex_token >> ~/.profile
    echo $variable_name_plex_token"="$variable_value_plex_token | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_plex_token is already set!";
fi

echo ""
variable_name_sickgear_token=SICKGEAR_TOKEN
if [ -z ${SICKGEAR_TOKEN+x} ]; then
    echo "$variable_name_sickgear_token is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_sickgear_token:"
    read variable_value_sickgear_token

    echo ""
    echo "adding " $variable_name_sickgear_token " to environment variables..."
    sudo echo "export "$variable_name_sickgear_token"="$variable_value_sickgear_token >> ~/.bashrc
    sudo echo $variable_name_sickgear_token"="$variable_value_sickgear_token >> ~/.profile
    echo $variable_name_sickgear_token"="$variable_value_sickgear_token | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_sickgear_token is already set!";
fi

echo ""
variable_name_sickchill_token=SICKCHILL_TOKEN
if [ -z ${SICKCHILL_TOKEN+x} ]; then
    echo "$variable_name_sickchill_token is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_sickchill_token:"
    read variable_value_sickchill_token

    echo ""
    echo "adding " $variable_name_sickchill_token " to environment variables..."
    sudo echo "export "$variable_name_sickchill_token"="$variable_value_sickchill_token >> ~/.bashrc
    sudo echo $variable_name_sickchill_token"="$variable_value_sickchill_token >> ~/.profile
    echo $variable_name_sickchill_token"="$variable_value_sickchill_token | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_sickchill_token is already set!";
fi

if [ "$restart" = true ]; then
    source ~/.bashrc
    source ~/.profile

    echo ""
    echo "do you want to restart your computer to apply changes in /etc/environment file? yes(y) or no(n)"
    read restart
    case $restart in
        y) sudo shutdown -r 0;;
        n) echo "don't forget to restart your computer manually";;
    esac
fi

exit
