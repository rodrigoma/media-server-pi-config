#!/bin/bash

echo "archive_extract_failed" $1 $2 $3 $4 $5 $6

curl http://apprise:9000/notify/${PYLOAD_NOTIFICATION} \
     -H "Content-Type: application/json" \
     -d '{ "title":"[PYLOAD] File Error Extracted", "body":"'"Error ao descompactar arquivo $2"'"}'
