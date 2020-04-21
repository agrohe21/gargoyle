#!/bin/sh
/root/projects/gargoyle/scripts/get_tcpconn_host.sh | awk '{ if($2 >= 1 || $3>=1 ) { print } }'
