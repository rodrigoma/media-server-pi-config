#!/bin/bash
# Rebuild da imagem openvpn+chromium
set -e

cd /home/pi/media-server-pi-config/services/openvpn
echo "Building openvpn container..."
docker compose build
echo "Build concluido!"
