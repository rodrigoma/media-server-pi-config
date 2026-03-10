#!/bin/bash

echo "all_archives_extracted" $1 $2 $3 $4 $5 $6

curl http://apprise:9000/notify/${PYLOAD_NOTIFICATION} \
     -H "Content-Type: application/json" \
     -d '{ "title":"[PYLOAD] all_archives_extracted", "body":"'"$1 - $2 - $3 - $4 - $5 - $6"'"}'
