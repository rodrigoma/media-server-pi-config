#!/bin/bash

echo "package_failed" $1 $2 $3 $4 $5 $6

title='[PYLOAD] package_failed'
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
