#!/bin/sh
# full backup of homedir 

tar -cpf /pik/cluster/backup/TMP.tar --directory=$HOME . 2>  /dev/null
mv /pik/cluster/backup/TMP.tar /pik/cluster/backup/HOME.tar
#compression, not needed yet
#pbzip2 -9 /pik/cluster/backup/HOME.tar