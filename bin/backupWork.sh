#!/bin/sh

BSHARE="$HOME/net/backup/"

if grep -qs $BSHARE /proc/mounts; then
    echo "Backup share ${BSHARE} is mounted"
    rsync -avz ${HOME}/work/tickets ${BSHARE}
else
    echo "Backup medium not mounted. Exiting"
    exit 1
fi
