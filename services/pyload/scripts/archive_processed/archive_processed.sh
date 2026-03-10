#!/bin/bash

echo "archive_processed" $1 $2 $3 $4 $5 $6

curl http://apprise:9000/notify/${PYLOAD_NOTIFICATION} \
     -H "Content-Type: application/json" \
     -d '{ "title":"[PYLOAD] archive_processed", "body":"'"$1 - $2 - $3 - $4 - $5 - $6"'"}'
