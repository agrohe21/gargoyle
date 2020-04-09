#!/bin/sh

cat /var/state/network | grep "network.wan.up" | awk 'BEGIN {FS="="}; {print $2}'| cut -c 2- | sed 's/.$//'
