#!/bin/sh


. /root/.profile

 
   current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")
   echo "Starting Gargoyle connection metrics generation:"$(date +"%Y-%m-%d-%H-%M-%S")
   logger -t gen_metrics_conn "Starting Gargoyle connection metrics generation"

   touch /root/projects/gargoyle/output/conn-$current_date_time

   /root/projects/gargoyle/scripts/get_conn_diff.sh      >> /root/projects/gargoyle/output/conn-$current_date_time

   if [ ! -s /root/projects/gargoyle/output/conn-$current_date_time ]; then
     rm /root/projects/gargoyle/output/conn-$current_date_time
   else
     aws s3 mv /root/projects/gargoyle/output/conn-$current_date_time s3://agrohe21-gargoyle-files/$current_date_time.conn
     #scp -P 29 /tmp/usb_mount/dev_sda1/aws/conn-$current_date_time admin@10.0.0.122:/volume2/gargoyle_nfs/$current_date_time.conn
     #if [ $? -eq 0 ]; then
     #  rm /tmp/usb_mount/dev_sda1/aws/conn-$current_date_time
     #fi
   fi

   echo "Completed Gargoyle connection metrics generation:"$(date +"%Y-%m-%d-%H-%M-%S")
   logger -t gen_metrics_conn "Finished Gargoyle connection metrics generation"

exit $?

