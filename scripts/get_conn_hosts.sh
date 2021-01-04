#!/bin/sh
wanip=$(/root/projects/gargoyle/scripts/get_wanipaddr.sh | awk '{print $1}')
cat /proc/net/arp | awk '{print $1,$4}' | grep -v "$wanip"| sort | head -n -1
