#!/bin/sh
 
#endless loop, will print the message every X seconds as indicated in the $wait_sec variable
 
if [ "$1" = '' ]; then
   wait_sec="600"
	echo "mon_gargoyle: No wait_sec passed in"
else
    wait_sec="$1"
fi

while [ 1 ]; do 
   #echo "Hello from Gargoyle BW monitoring:"$(date +"%Y-%m-%d-%H-%M-%S")

   current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")
   /root/projects/gargoyle/scripts/get_hosts.sh       >> /tmp/usb_mount/dev_sda1/nfs/hosts-named-$current_date_time
   /root/projects/gargoyle/scripts/get_conn_hosts.sh  >> /tmp/usb_mount/dev_sda1/nfs/hosts-conn-$current_date_time
   /root/projects/gargoyle/scripts/get_ethers.sh      >> /tmp/usb_mount/dev_sda1/nfs/hosts-ethers-$current_date_time
   /root/projects/gargoyle/scripts/get_dhcp_leases.sh >> /tmp/usb_mount/dev_sda1/nfs/hosts-dhcp-$current_date_time
   /root/projects/gargoyle/scripts/get_wanipname.sh   >> /tmp/usb_mount/dev_sda1/nfs/hosts-wan-$current_date_time
   /root/projects/gargoyle/scripts/get_quotas.sh      >> /tmp/usb_mount/dev_sda1/nfs/quota-event-$current_date_time
   /root/projects/gargoyle/scripts/get_quota_dim.sh   >> /tmp/usb_mount/dev_sda1/nfs/quota-bucket-$current_date_time
   /root/projects/gargoyle/scripts/bw_get_download.sh >> /tmp/usb_mount/dev_sda1/nfs/bw-dlminute-$current_date_time
   /root/projects/gargoyle/scripts/bw_get_upload.sh   >> /tmp/usb_mount/dev_sda1/nfs/bw-ulminute-$current_date_time
   /root/projects/gargoyle/scripts/get_webmon.sh      >> /tmp/usb_mount/dev_sda1/nfs/web-sites-$current_date_time
   /root/projects/gargoyle/scripts/get_tcpconn.sh     >> /tmp/usb_mount/dev_sda1/nfs/conn-tcp-$current_date_time
   /root/projects/gargoyle/scripts/get_udpconn.sh     >> /tmp/usb_mount/dev_sda1/nfs/conn-udp-$current_date_time

   sleep $wait_sec
done
 
exit 0


