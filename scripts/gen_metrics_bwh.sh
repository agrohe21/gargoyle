#!/bin/sh

. /root/.profile

 
   echo "Starting Gargoyle Bandwidth Hourly metrics generation:"$(date +"%Y-%m-%d-%H-%M-%S")
   logger -t gen_metrics_bwh "Starting Gargoyle Bandwidth Hourly metrics generation"

   current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")
   /root/projects/gargoyle/scripts/get_bw_hour_diff.sh   >> /root/projects/gargoyle/output/bw-hour-$current_date_time
   if [ ! -s /root/projects/gargoyle/output/bw-hour-$current_date_time ]; then
     rm /root/projects/gargoyle/output/bw-hour-$current_date_time
   else
     aws s3 mv /root/projects/gargoyle/output/bw-hour-$current_date_time s3://agrohe21-gargoyle-files/$current_date_time.bwh
     #scp -P 29 /tmp/usb_mount/dev_sda1/aws/bw-hour-$current_date_time admin@10.0.0.122:/volume2/gargoyle_nfs/$current_date_time.bwh
     #if [ $? -eq 0 ]; then
     #  rm /tmp/usb_mount/dev_sda1/aws/bw-hour-$current_date_time
     #fi
   fi

   echo "Finished Gargoyle metrics generation:"$(date +"%Y-%m-%d-%H-%M-%S")
   logger -t gen_metrics_bwh "Finished Gargoyle Bandwidth Hourly metrics generation"
 
exit $?
