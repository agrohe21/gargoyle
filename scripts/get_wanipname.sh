#!/bin/sh

#cat /var/state/network | grep "network.wan.ipaddr" | awk 'BEGIN {FS="="}; {print $2}'| cut -c 2- | sed 's/.$//'
#cat /var/state/network | grep "network.wan.ipaddr" | awk 'BEGIN {FS="="}; {print $2,"Gargoyle"}'|cut -c 2-| sed 's/\'//'
cat /var/state/network | grep "network.wan.ipaddr" | sed 's/.$//'| awk 'BEGIN {FS="="}; {print $2,"Gargoyle"}'|cut -c 2-
