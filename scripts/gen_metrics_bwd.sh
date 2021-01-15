#!/bin/sh

. /root/.profile

 
   current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")
   sleep 2
   echo "Starting Gargoyle metrics generation:"$(date +"%Y-%m-%d-%H-%M-%S")
   logger -t gen_metrics_bwd "Starting Gargoyle Bandwidth Day metrics generation"

   /root/projects/gargoyle/scripts/get_bw_day_diff.sh    >>  /root/projects/gargoyle/output/bw-day-$current_date_time 
   if [ ! -s  /root/projects/gargoyle/output/bw-day-$current_date_time ]; then
     rm  /root/projects/gargoyle/output/bw-day-$current_date_time
   else
     aws s3 mv /root/projects/gargoyle/output/bw-day-$current_date_time s3://agrohe21-gargoyle-files/$current_date_time.bwd
     #scp -P 29 /tmp/usb_mount/dev_sda1/aws/bw-day-$current_date_time admin@10.0.0.122:/volume2/gargoyle_nfs/$current_date_time.bwd
     #if [ $? -eq 0 ]; then
     #  rm /tmp/usb_mount/dev_sda1/aws/bw-day-$current_date_time
     #fi
   fi

   echo "Finished  Gargoyle metrics generation:"$(date +"%Y-%m-%d-%H-%M-%S")
   logger -t gen_metrics_bwd "Finished Gargoyle Bandwidth Day metrics generation"
 
exit $?
