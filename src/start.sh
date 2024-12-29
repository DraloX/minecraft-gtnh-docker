#!/bin/sh

# copy persisted data from _data volume if they exist
/opt/server/copydata.sh

# persist inital data files
/opt/server/savedata.sh

# add a cron to persist config files and start crond as detached process
touch tmpcron
echo "*/5 * * * * /opt/server/savedata.sh" >> tmpcron
crontab tmpcron
rm tmpcron
crond &

while true
do
   java -Xms6G -Xmx8G -Dfml.readTimeout=180 @java9args.txt -jar lwjgl3ify-forgePatches.jar nogui
    # sava data files
    /opt/server/savedata.sh
    echo "If you want to completely stop the server process now, press Ctrl+C before the time is up!"
    echo "Rebooting in:"
    for i in 12 11 10 9 8 7 6 5 4 3 2 1
    do
        echo "$i..."
        sleep 1
    done
    echo "Rebooting now!"
done