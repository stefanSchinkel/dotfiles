#!/bin/sh
#
# Crontab definition: 
# backup every 30min from 9 to five, Tue to Fri
# */30  9-17 * * 1-5   /home/schinkel/bin/rdiffBackup.sh > /dev/null
rdiff-backup -v3 /home/schinkel/Downloads/ /pik/cluster/backup/Downloads/
rdiff-backup -v3  /home/schinkel/temp/ /pik/cluster/backup/temp/
rdiff-backup -v3   /home/schinkel/work/ /pik/cluster/backup/work/
