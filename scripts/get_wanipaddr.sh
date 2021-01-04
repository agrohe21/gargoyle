#!/bin/sh

cat /var/state/network | grep "network.wan.ipaddr" | awk 'BEGIN {FS="="}; {print $2}'| cut -c 2- | sed 's/.$//' |awk '{print $1,"Gargoyle"}'
