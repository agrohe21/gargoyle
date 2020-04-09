#!/bin/ash
bw_get -i bdist1-upload-minute-15 -h |awk '{ if($1 > 0) { print } }'|grep -v "(Now)"
