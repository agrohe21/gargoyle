#!/bin/sh
bw_get -i bdist1-download-minute-60 | grep -v "COMBINED" | awk '{ if($2 >= 1048576) { print $1,$2/1024/1024/1024} }'

