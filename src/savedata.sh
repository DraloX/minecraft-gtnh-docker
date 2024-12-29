#!/bin/sh

echo "run savedata.sh"
files="whitelist.json server.properties ops.json banned-ips.json banned-players.json"

for file in $files
do
    echo "saving $file ..."
    cp /opt/server/$file /opt/server/_data/
done

echo "savedata.sh finished"