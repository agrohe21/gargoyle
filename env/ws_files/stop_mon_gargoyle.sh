#!/bin/sh

monPID=`cat /home/agrohe21/projects/gargoyle/config/gargoyle.pid`
echo 'PID:'$monPID
gPID=`ps -e -opid,pgid |grep $monPID | awk '{print $2}'`
echo 'gPID:'$gPID

kill -15 -$gPID
