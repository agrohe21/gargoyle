#!/bin/sh

nslookup $1 |head -n 1|awk -F'name = ' '{print $2}'|sed 's/.$//'
