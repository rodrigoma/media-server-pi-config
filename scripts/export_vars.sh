#!/bin/bash

#
# FILE LOCATION: $HOME/scripts/export_vars.sh
#
# TURN EXEC: chmod +x $HOME/scripts/export_vars.sh
#

restart=false

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


if [ "$restar" = true ]; then
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