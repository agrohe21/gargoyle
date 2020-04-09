#!/bin/sh
cat /tmp/dhcp.leases | awk '{print $3,$2,$4}'|sort
