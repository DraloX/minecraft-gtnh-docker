#!/bin/sh

echo "run copydata.sh"
files="whitelist.json server.properties ops.json banned-ips.json banned-players.json"

for file in $files
do
    echo "copying $file ..."
    # Check for whitelist file 
    ls /opt/server/_data | grep $file > /dev/null
    if [ $? -eq 0 ]
    then
        cp /opt/server/_data/$file /opt/server/
        echo -e "$file: found"
    else
        echo -e "$file: not found"
    fi
done

echo "copydata.sh finished"