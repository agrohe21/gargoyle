cd /home/agrohe21/projects/gargoyle/env/ws_files

current_date_time=`date +%Y-%m-%d-%H-%M-%S`
echo $current_date_time

./kitchen.sh -norep -file=/home/agrohe21/projects/gargoyle/content/public/gargoyle/run_bwmon_gather.kjb -logfile=/home/agrohe21/projects/log/gargoyle/bwmon_gather-$current_date_time

EXIT_CODE=$?
echo ErrorCode:$EXIT_CODE
exit $EXIT_CODE
