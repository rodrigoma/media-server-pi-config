#!/bin/bash

echo "download_finished" $1 $2 $3 $4 $5 $6

curl http://apprise:9000/notify/${PYLOAD_NOTIFICATION} \
     -H "Content-Type: application/json" \
     -d '{ "title":"[PYLOAD] Download Finished", "body":"'"Download do arquivo $2 finalizado com sucesso"'"}'
