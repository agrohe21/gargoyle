#!/bin/sh

. /root/.profile

 

   current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")
   sleep 2
   echo "Starting Gargoyle Bandwidth Month metrics generation:"$(date +"%Y-%m-%d-%H-%M-%S")
   logger -t gen_metrics_bwo "Starting Gargoyle Bandwidth Monthly metrics generation"

   /root/projects/gargoyle/scripts/get_bw_month_diff.sh  >>  /root/projects/gargoyle/output/bw-month-$current_date_time
   if [ ! -s  /root/projects/gargoyle/output/bw-month-$current_date_time ]; then
     rm  /root/projects/gargoyle/output/bw-month-$current_date_time
   else
     aws s3 mv /root/projects/gargoyle/output/bw-month-$current_date_time s3://agrohe21-gargoyle-files/$current_date_time.bwo
     #scp -P 29 /tmp/usb_mount/dev_sda1/aws/bw-month-$current_date_time admin@10.0.0.122:/volume2/gargoyle_nfs/$current_date_time.bwo
     #if [ $? -eq 0 ]; then
     #  rm /tmp/usb_mount/dev_sda1/aws/bw-month-$current_date_time
     #fi
   fi

   echo "Finished Gargoyle Bandwidth Month metrics generation:"$(date +"%Y-%m-%d-%H-%M-%S")
   logger -t gen_metrics_bwo "Finished Gargoyle Bandwidth Monthly metrics generation"
 
exit $?
