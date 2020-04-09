#!/bin/sh

current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")

wanup=`/root/projects/gargoyle/scripts/get_wanup.sh`

if [ $wanup == "0" ]
then
  cat /root/projects/gargoyle/config/mail_template_wandown.txt > /root/projects/gargoyle/output/wandown_alert-$current_date_time.txt
  cat /root/projects/gargoyle/output/wandown_alert_$current_date_time.txt | msmtp agrohe21@yahoo.com
fi
