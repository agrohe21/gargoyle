#!/bin/sh

cat /proc/webmon_recent_domains | awk '{print $1,$2,$3}' |sort
