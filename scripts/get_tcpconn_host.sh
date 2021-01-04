#!/bin/sh
grep "ESTABLISHED" /proc/net/nf_conntrack |grep -v 'UNREPLIED'| awk '{ if($1 == "ipv4" && $3 == "tcp") { print $7,$12,$18 } }'|sort | sed 's/src=//g; s/dst=//g; s/packets=//g; s/bytes=//g'|awk '{s[$1] += $2; r[$1] += $3} END{for (i in s) print i, s[i]/1000000, r[i]/1000000}'|sort
