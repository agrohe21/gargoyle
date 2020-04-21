#!/bin/sh
 
#endless loop, will print the message every X seconds as indicated in the $wait_sec variable
 
if [ "$1" = '' ]; then
   wait_sec="60"
	echo "mon_gargoyle: No wait_sec passed in"
else
    wait_sec="$1"
    echo "mon_gargoyle: wait_sec:$wait_sec"
fi

while [ 1 ]; do 
   current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")
   /root/projects/gargoyle/scripts/get_tcpconn.sh     >> /root/projects/gargoyle/output/conn-tcp-$current_date_time
   /root/projects/gargoyle/scripts/get_udpconn.sh     >> /root/projects/gargoyle/output/conn-udp-$current_date_time

   sleep $wait_sec
done
 
exit 0


