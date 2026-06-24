#!/bin/sh

set -e

REGISTERED_FLAG="/var/lib/sqlbak/.registered"

if [ ! -f "$REGISTERED_FLAG" ]; then
    echo "[sqlbak] Registering server..."
    sqlbak -r -k "$SQLBAK_TOKEN" -n "${SQLBAK_SERVER_NAME:-pi}"

    echo "[sqlbak] Creating default connection..."
    sqlbak --add-connection --db-type=mysql --user=root

    mkdir -p "$(dirname "$REGISTERED_FLAG")"
    touch "$REGISTERED_FLAG"
fi

echo "[sqlbak] Starting agent..."
exec sqlbak --agent
