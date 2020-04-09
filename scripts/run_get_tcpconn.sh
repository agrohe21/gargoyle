#!/bin/sh
/usr/lib/gargoyle/define_host_vars.sh |grep conntrackLines |grep -v "Array\(\)" | cut -c 22-
