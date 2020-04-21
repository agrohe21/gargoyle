#!/bin/sh

cat /var/state/network | grep -- "network.wan\.\|network.lan."| awk 'BEGIN {FS="="}; {print $1$2}'|  sed 's/.$//'| sed 's/'\''/\=/'
