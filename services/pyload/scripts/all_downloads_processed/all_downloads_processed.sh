#!/bin/bash

echo "all_downloads_processed" $1 $2 $3 $4 $5 $6

curl http://apprise:9000/notify/${PYLOAD_NOTIFICATION} \
     -H "Content-Type: application/json" \
     -d '{ "title":"[PYLOAD] all_downloads_processed", "body":"'"$1 - $2 - $3 - $4 - $5 - $6"'"}'
