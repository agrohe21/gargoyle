#!/bin/sh
grep "ESTABLISHED" /proc/net/nf_conntrack |grep -v 'UNREPLIED'| awk '{ if($1 == "ipv4" && $3 == "tcp") { print $7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$3 } }'|sort | sed 's/src=//g; s/dst=//g; s/packets=//g; s/bytes=//g; s/sport=//g; s/dport=//g'
