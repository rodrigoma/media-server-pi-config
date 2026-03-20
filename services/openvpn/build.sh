#!/bin/bash
# Rebuild da imagem openvpn+chromium
set -e

cd "$(cd "$(dirname "$0")" && pwd)"
echo "Building openvpn container..."
docker compose build
echo "Build concluido!"
