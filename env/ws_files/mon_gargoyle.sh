cd /home/agrohe21/projects/gargoyle/env/ws_files

current_date_time=`date +%Y-%m-%d-%H-%M-%S`
echo $current_date_time

log_file=/home/agrohe21/projects/log/gargoyle/mon_gargoyle-$current_date_time.log
./kitchen.sh -norep -file=/home/agrohe21/projects/gargoyle/content/public/gargoyle/d_mon_gargoyle.kjb "-param:MON_KTR=mon_gargoyle" "-param:max_tries=1000" "-param:GEN_ROW_KTR=streamInput" "-param:GEN_ROW_INTERVAL=30000" -maxloglines:0 -maxlogtimeout:0 -level=Basic -logfile=$log_file > /dev/null 2>&1 &

PID=$!

echo $PID > /home/agrohe21/projects/gargoyle/config/gargoyle.pid

EXIT_CODE=$?
echo ErrorCode:$EXIT_CODE
exit $EXIT_CODE
