#!/usr/bin/awk -f

awk -v var=$1 '$1 == var {print $2}'
