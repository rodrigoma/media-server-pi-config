#!/bin/bash

echo "package_extract_failed" $1 $2 $3 $4 $5 $6

curl http://apprise:9000/notify/${PYLOAD_NOTIFICATION} \
     -H "Content-Type: application/json" \
     -d '{ "title":"[PYLOAD] package_extract_failed", "body":"'"$1 - $2 - $3 - $4 - $5 - $6"'"}'
