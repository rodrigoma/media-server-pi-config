#!/bin/bash

echo "archive_extracted" $1 $2 $3 $4 $5 $6

curl http://apprise:9000/notify/${PYLOAD_NOTIFICATION} \
     -H "Content-Type: application/json" \
     -d '{ "title":"[PYLOAD] File Success Extracted", "body":"'"Sucesso ao descompactar arquivo $2"'"}'
