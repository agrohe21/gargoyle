#!/bin/sh

nslookup $1 | awk '-Fame = ' '{print $2}'| tail -n 2 |head -n 1
