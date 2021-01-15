#!/bin/sh

current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")
echo $current_date_time

/usr/lib/gargoyle/create_backup.sh >/dev/null 2>&1

if [ -s /tmp/backup/backup.tar.gz ]
then
  cp /tmp/backup/backup.tar.gz /tmp/backup/backup.tar.gz-$current_date_time
else
  echo No backup file
fi

