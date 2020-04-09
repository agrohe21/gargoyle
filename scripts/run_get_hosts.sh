#!/bin/sh
/usr/lib/gargoyle/define_host_vars.sh |grep dhcpLeaseLines |grep -v "\= new"|cut -c 22-|awk '{print $1,$2,$3,$4}'
