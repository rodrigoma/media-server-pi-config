#!/bin/bash

echo "archive_extracted" $1 $2 $3 $4 $5 $6

# Notificação original (legado)
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

# Extrair nome da pasta a partir do path do container ($4)
# Ex: /downloads/Mr. Deeds/ -> Mr. Deeds
ALBUM_FOLDER=$(echo "$4" | sed 's|^/downloads/||' | sed 's|/$||')
if [ -n "$ALBUM_FOLDER" ]; then
    curl -s -X POST http://hal9000:18789/hooks/agent \
         -H "Authorization: Bearer pyload-soundtracks-hal9000" \
         -H "Content-Type: application/json" \
         -d "{\"message\": \"PyLoad terminou de extrair: $ALBUM_FOLDER\", \"name\": \"PyLoad\", \"deliver\": true, \"agentId\": \"coda\", \"channel\": \"telegram\", \"to\": \"21587697\"}" || true
fi
