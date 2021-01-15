#!/bin/sh

. /root/.profile
 
   current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")
   sleep 2
   echo "Starting Gargoyle Bandwidth Minute metrics generation:"$(date +"%Y-%m-%d-%H-%M-%S")
   logger -t gen_metrics_bwm "Starting Gargoyle Bandwidth Minute metrics generation"


   /root/projects/gargoyle/scripts/get_bw_minute_diff.sh >> /root/projects/gargoyle/output/bw-minute-$current_date_time
   if [ ! -s  /root/projects/gargoyle/output/bw-minute-$current_date_time ]; then
     rm /root/projects/gargoyle/output/bw-minute-$current_date_time
   else
     #aws s3 mv /root/projects/gargoyle/output/bw-minute-$current_date_time s3://agrohe21-gargoyle-files/$current_date_time.bwm
     #scp -P 29 /tmp/usb_mount/dev_sda1/aws/bw-minute-$current_date_time admin@10.0.0.122:/volume2/gargoyle_nfs/$current_date_time.bwm
     #if [ $? -eq 0 ]; then
     #  rm /tmp/usb_mount/dev_sda1/aws/bw-minute-$current_date_time
     #fi
   fi

   echo "Finished Gargoyle Bandwidth Minute metrics generation:"$(date +"%Y-%m-%d-%H-%M-%S")
   logger -t gen_metrics_bwm "Finished Gargoyle Bandwidth Minute metrics generation"
exit $?
