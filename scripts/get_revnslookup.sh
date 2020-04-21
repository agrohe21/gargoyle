#!/bin/sh

nslookup $1 |grep Address|grep -v '127.0'|head -n 1|awk '{print $2}'
