#!/bin/bash

#
# FILE LOCATION: $HOME/scripts/export_vars.sh
#
# TURN EXEC: chmod +x $HOME/scripts/export_vars.sh
#

restart=false

# ── SSH ───────────────────────────────────────────────────────────────────────

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

# ── WiFi ──────────────────────────────────────────────────────────────────────

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

# ── User ──────────────────────────────────────────────────────────────────────

echo ""
variable_name_username=USERNAME
if [ -z ${USERNAME+x} ]; then
    echo "$variable_name_username is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_username:"
    read variable_value_username

    echo ""
    echo "adding " $variable_name_username " to environment variables..."
    sudo echo "export "$variable_name_username"="$variable_value_username >> ~/.bashrc
    sudo echo $variable_name_username"="$variable_value_username >> ~/.profile
    echo $variable_name_username"="$variable_value_username | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_username is already set!";
fi

echo ""
variable_name_password=PASSWORD
if [ -z ${PASSWORD+x} ]; then
    echo "$variable_name_password is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_password:"
    read variable_value_password

    echo ""
    echo "adding " $variable_name_password " to environment variables..."
    sudo echo "export "$variable_name_password"="$variable_value_password >> ~/.bashrc
    sudo echo $variable_name_password"="$variable_value_password >> ~/.profile
    echo $variable_name_password"="$variable_value_password | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_password is already set!";
fi

# ── Traefik ───────────────────────────────────────────────────────────────────

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

# ── Google Drive ──────────────────────────────────────────────────────────────

echo ""
variable_name_google_drive_folder_id=GOOGLE_DRIVE_FOLDER_ID
if [ -z ${GOOGLE_DRIVE_FOLDER_ID+x} ]; then
    echo "$variable_name_google_drive_folder_id is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_google_drive_folder_id:"
    read variable_value_google_drive_folder_id

    echo ""
    echo "adding " $variable_name_google_drive_folder_id " to environment variables..."
    sudo echo "export "$variable_name_google_drive_folder_id"="$variable_value_google_drive_folder_id >> ~/.bashrc
    sudo echo $variable_name_google_drive_folder_id"="$variable_value_google_drive_folder_id >> ~/.profile
    echo $variable_name_google_drive_folder_id"="$variable_value_google_drive_folder_id | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_google_drive_folder_id is already set!";
fi

# ── Telegram ──────────────────────────────────────────────────────────────────

echo ""
variable_name_telegram_chat_id=TELEGRAM_CHAT_ID
if [ -z ${TELEGRAM_CHAT_ID+x} ]; then
    echo "$variable_name_telegram_chat_id is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_telegram_chat_id:"
    read variable_value_telegram_chat_id

    echo ""
    echo "adding " $variable_name_telegram_chat_id " to environment variables..."
    sudo echo "export "$variable_name_telegram_chat_id"="$variable_value_telegram_chat_id >> ~/.bashrc
    sudo echo $variable_name_telegram_chat_id"="$variable_value_telegram_chat_id >> ~/.profile
    echo $variable_name_telegram_chat_id"="$variable_value_telegram_chat_id | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_telegram_chat_id is already set!";
fi

echo ""
variable_name_telegram_token=TELEGRAM_TOKEN
if [ -z ${TELEGRAM_TOKEN+x} ]; then
    echo "$variable_name_telegram_token is unset";
    echo "configure now..."

    echo "Enter variable value for $variable_name_telegram_token:"
    read variable_value_telegram_token

    echo ""
    echo "adding " $variable_name_telegram_token " to environment variables..."
    sudo echo "export "$variable_name_telegram_token"="$variable_value_telegram_token >> ~/.bashrc
    sudo echo $variable_name_telegram_token"="$variable_value_telegram_token >> ~/.profile
    echo $variable_name_telegram_token"="$variable_value_telegram_token | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_telegram_token is already set!";
fi

# ── Tokens ────────────────────────────────────────────────────────────────────

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

# ── Derived variables (computed automatically, no user input needed) ───────────

_USERNAME="${variable_value_username:-$USERNAME}"
_PASSWORD="${variable_value_password:-$PASSWORD}"
_TELEGRAM_TOKEN="${variable_value_telegram_token:-$TELEGRAM_TOKEN}"

echo ""
variable_name_user_id=USER_ID
if [ -z ${USER_ID+x} ]; then
    variable_value_user_id=$(id -u)
    echo "adding " $variable_name_user_id " (auto-derived: $variable_value_user_id) to environment variables..."
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
    variable_value_group_id=$(id -g)
    echo "adding " $variable_name_group_id " (auto-derived: $variable_value_group_id) to environment variables..."
    sudo echo "export "$variable_name_group_id"="$variable_value_group_id >> ~/.bashrc
    sudo echo $variable_name_group_id"="$variable_value_group_id >> ~/.profile
    echo $variable_name_group_id"="$variable_value_group_id | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_group_id is already set!";
fi

echo ""
variable_name_media_repo_path=MEDIA_REPO_PATH
if [ -z ${MEDIA_REPO_PATH+x} ]; then
    variable_value_media_repo_path="${HOME}/media-server-pi-config"
    echo "adding " $variable_name_media_repo_path " (auto-derived: $variable_value_media_repo_path) to environment variables..."
    sudo echo "export "$variable_name_media_repo_path"="$variable_value_media_repo_path >> ~/.bashrc
    sudo echo $variable_name_media_repo_path"="$variable_value_media_repo_path >> ~/.profile
    echo $variable_name_media_repo_path"="$variable_value_media_repo_path | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_media_repo_path is already set!";
fi

echo ""
variable_name_user_email=USER_EMAIL
if [ -z ${USER_EMAIL+x} ]; then
    variable_value_user_email="${_USERNAME}@gmail.com"
    echo "adding " $variable_name_user_email " (auto-derived: $variable_value_user_email) to environment variables..."
    sudo echo "export "$variable_name_user_email"="$variable_value_user_email >> ~/.bashrc
    sudo echo $variable_name_user_email"="$variable_value_user_email >> ~/.profile
    echo $variable_name_user_email"="$variable_value_user_email | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_user_email is already set!";
fi

echo ""
variable_name_user_domain=USER_DOMAIN
if [ -z ${USER_DOMAIN+x} ]; then
    variable_value_user_domain="${_USERNAME}.duckdns.org"
    echo "adding " $variable_name_user_domain " (auto-derived: $variable_value_user_domain) to environment variables..."
    sudo echo "export "$variable_name_user_domain"="$variable_value_user_domain >> ~/.bashrc
    sudo echo $variable_name_user_domain"="$variable_value_user_domain >> ~/.profile
    echo $variable_name_user_domain"="$variable_value_user_domain | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_user_domain is already set!";
fi

echo ""
variable_name_bot_telegram_token=BOT_TELEGRAM_TOKEN
if [ -z ${BOT_TELEGRAM_TOKEN+x} ]; then
    # Normalize _TELEGRAM_TOKEN to avoid double "bot" prefix (handle both raw and prefixed inputs)
    normalized_telegram_token="${_TELEGRAM_TOKEN#bot}"
    variable_value_bot_telegram_token="bot${normalized_telegram_token}"
    echo "adding " $variable_name_bot_telegram_token " (auto-derived) to environment variables..."
    sudo echo "export "$variable_name_bot_telegram_token"="$variable_value_bot_telegram_token >> ~/.bashrc
    sudo echo $variable_name_bot_telegram_token"="$variable_value_bot_telegram_token >> ~/.profile
    echo $variable_name_bot_telegram_token"="$variable_value_bot_telegram_token | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_bot_telegram_token is already set!";
fi

echo ""
variable_name_transmission_server=TRANSMISSION_SERVER
if [ -z ${TRANSMISSION_SERVER+x} ]; then
    variable_value_transmission_server="transmission:9091 --auth ${_USERNAME}:${_PASSWORD}"
    echo "adding " $variable_name_transmission_server " (auto-derived) to environment variables..."
    sudo echo "export "$variable_name_transmission_server"="$variable_value_transmission_server >> ~/.bashrc
    sudo echo $variable_name_transmission_server"="$variable_value_transmission_server >> ~/.profile
    echo $variable_name_transmission_server"="$variable_value_transmission_server | sudo tee -a /etc/environment
    restart=true
else
    echo "$variable_name_transmission_server is already set!";
fi

# ── Finish ────────────────────────────────────────────────────────────────────

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
