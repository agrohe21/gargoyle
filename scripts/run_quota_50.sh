#!/bin/sh
print_quotas |grep quotaPercents |grep -v "\= \[\];"|grep -v " 0.000," |grep -v "var quotaPercents" |awk '/\]\[/{sub(/.*\]\[ /, "");print}' |awk '{print $1, $5}'|cut -c 2- |sed 's/.$//'|sed 's/"//'| sed 's/"//'|awk '{ if($2 >= 50) { print } }'
