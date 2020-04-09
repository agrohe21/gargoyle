cd /home/agrohe21/projects/gargoyle/env/ws_files

current_date_time=`date +%Y-%m-%d-%H-%M-%S`
echo $current_date_time

log_file=/home/agrohe21/projects/log/gargoyle/mon_gargoyle-$current_date_time.log
./kitchen.sh -norep -file=/home/agrohe21/projects/gargoyle/content/public/gargoyle/mon_gargoyle.kjb -maxloglines:0 -maxlogtimeout:0 -level=Basic -logfile=$log_file > /dev/null 2>&1 &

PID=$!

#echo $PID > /home/agrohe21/projects/gargoyle/config/gargoyle.pid

EXIT_CODE=$?
echo ErrorCode:$EXIT_CODE
exit $EXIT_CODE
