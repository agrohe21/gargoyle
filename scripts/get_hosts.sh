#!/bin/sh
cat /etc/hosts | awk '{print $1,$2}' |sort |sed -e 1d;/root/projects/gargoyle/scripts/get_wanipaddr.sh
