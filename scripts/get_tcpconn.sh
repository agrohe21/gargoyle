#!/bin/sh
#grep "ESTABLISHED" /proc/net/nf_conntrack |awk '{ if($1 == "ipv4" && $3 == "tcp") { print $7,$8,$11,$12,$13,$14,$17,$18 } }'|sort | sed 's/src=//g; s/dst=//g; s/packets=//g; s/bytes=//g'
cat /proc/net/nf_conntrack |awk '{ if($1 == "ipv4" && $3 == "tcp") { print $6,$7,$8,$11,$12,$13,$14,$17,$18 } }'|sort | sed 's/src=//g; s/dst=//g; s/packets=//g; s/bytes=//g'
