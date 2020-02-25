#!/bin/bash

IP="10.0.0.1"

out=$(ssh root@${IP} -i ~/.ssh/gargoyle "bw_get -i bdist1-download-minute-1440 | awk 'FNR==NR{ a[\$3]=\$4; next } \$1 in a { \$1 = a[\$1] } { print }' /tmp/dhcp.leases -" | sort -gr -t' ' -k 2 | column -t | tr -s ' ')

# convert bytes to human readable form. e.g. 20456634 -> 19.51 MiB
bytesToHuman() {
    local L_BYTES="${1:-0}"
    local L_PAD="${2:-no}"
    local L_BASE="${3:-1024}"
    BYTESTOHUMAN_RESULT=$(awk -v bytes="${L_BYTES}" -v pad="${L_PAD}" -v base="${L_BASE}" 'function human(x, pad, base) {
         if(base!=1024)base=1000
         basesuf=(base==1024)?"iB":"B"

         s="BKMGTEPYZ"
         while (x>=base && length(s)>1)
               {x/=base; s=substr(s,2)}
         s=substr(s,1,1)

         xf=(pad=="yes") ? ((s=="B")?"%5d   ":"%8.2f") : ((s=="B")?"%d":"%.2f")
         s=(s!="B") ? (s basesuf) : ((pad=="no") ? s : ((basesuf=="iB")?(s "  "):(s " ")))

         return sprintf( (xf " %s\n"), x, s)
      }
      BEGIN{print human(bytes, pad, base)}')
    echo "$BYTESTOHUMAN_RESULT"
}

while read -r line; do
   host=$(echo "$line" | cut -d' ' -f1)
   bytes=$(echo "$line" | cut -d' ' -f2)
   human=$(bytesToHuman "$bytes")

   table+="$host,$human"
   table+=$'\n'
done <<< "$out"

echo "$table" | column -s',' -t | sed "s,MiB,$(tput setaf 1)&$(tput sgr0)," | sed '1,1{H;1h;d;};$G'
