#!/bin/sh
cat /proc/net/arp | awk '{print $1,$4}' | sort | head -n -1
