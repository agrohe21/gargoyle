#!/bin/sh

current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")
#echo $current_date_time

/usr/lib/gargoyle/create_backup.sh

if [ -s /tmp/backup/backup.tar.gz ]
then
  cp /tmp/backup/backup.tar.gz /tmp/usb_mount/dev_sda1/backup/backup.tar.gz-$current_date_time
else
  echo No backup file
fi



