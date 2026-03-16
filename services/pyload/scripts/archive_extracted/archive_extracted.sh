#!/bin/bash

echo "archive_extracted" $1 $2 $3 $4 $5 $6

# Notificação original
title='[PYLOAD] archive_extracted'
body="$1 - $2 - $3 - $4 - $5 - $6"

json_payload=$(TITLE="$title" BODY="$body" python3 - << 'PY'
import json
import os
title = os.environ.get("TITLE", "")
body = os.environ.get("BODY", "")
print(json.dumps({"title": title, "body": body}))
PY
)

curl --fail --show-error --silent \
     --connect-timeout 5 --max-time 10 \
     -H "Content-Type: application/json" \
     -d "$json_payload" \
     http://apprise:8000/notify/${PYLOAD_NOTIFICATION} || true

# Chamar HAL para organizar na biblioteca OST
PACKAGE_NAME="$1"
if [ -n "$PACKAGE_NAME" ]; then
    curl -s -X POST http://hal9000:18789/hooks/agent \
         -H "Authorization: Bearer pyload-soundtracks-hal9000" \
         -H "Content-Type: application/json" \
         -d "{\"message\": \"PyLoad terminou de extrair o package: $PACKAGE_NAME. Execute: python3 /home/pi/.openclaw/workspace/soundtracks_organize.py '$PACKAGE_NAME'\", \"name\": \"PyLoad\", \"deliver\": true, \"channel\": \"telegram\", \"to\": \"21587697\"}" || true
fi
