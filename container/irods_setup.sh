#!/bin/bash
set -e
PG_HOST=localhost

service postgresql start

mkdir -p /data
chmod a+rw /data

set -e
if [ -e /data/irods.init.done ]
then
    echo "irods already configured"
    echo "starting"
    service irods start
else
    cat /irods_ans.txt | python /var/lib/irods/scripts/setup_irods.py
    touch /data/irods.init.done
fi

while true; do sleep 30; done;
