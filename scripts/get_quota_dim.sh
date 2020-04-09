#!/bin/sh
print_quotas |grep quotaIpLists |grep -v "= \[ \];"|grep -v "var quotaIpLists" |cut -c 15- |sed 's/"\] = \[ "/ /'| sed 's/"];//' |awk '{print $1}'|sort
