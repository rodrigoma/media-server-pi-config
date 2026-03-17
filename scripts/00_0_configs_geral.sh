#!/bin/sh

echo "----------[START] 00_0_configs_geral.sh"

echo "" && sleep 2

echo "configure timezone Sao Paulo"
sudo timedatectl set-timezone America/Sao_Paulo

echo "" && sleep 2

echo "add ll alias"
echo "alias ll='ls -lhFAv --group-directories-first'" > ~/.bash_aliases
echo '
unalias dpsa 2>/dev/null
dpsa() {
  docker ps -a "$@" --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.RunningFor}}\t{{.Names}}" | \
  sed -E "s/(.*Up.*)/\x1b[32m&\x1b[0m/"
}' >> ~/.bash_aliases

echo '
# Atalhos rápidos para o hardware do Pi
alias temp='vcgencmd measure_temp'
alias clock='vcgencmd measure_clock arm'
alias vcore='vcgencmd measure_volts core'
alias mem='free -h -t'
' >> ~/.bash_aliases

source ~/.bashrc

echo "" && sleep 2

echo "Make sure Raspbian OS can use the entire SD card."
sudo raspi-config --expand-rootfs

echo "" && sleep 2

echo "Permanently enable SSH server"
sudo systemctl enable ssh
sudo systemctl start ssh

echo "" && sleep 2

echo "change ssh port"
sudo sed -i 's/^#*Port .*/Port '"$SSH_PORT"'/' /etc/ssh/sshd_config

echo "" && sleep 2

echo "----------[ END ] 00_0_configs_geral.sh"
