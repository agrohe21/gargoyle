cd /home/agrohe21/projects/gargoyle/env/ws_files

./kitchen.sh -norep -file=/home/agrohe21/projects/gargoyle/content/public/gargoyle/run_bwmon_gather.kjb 

EXIT_CODE=$?
echo Error:$EXIT_CODE
exit $EXIT_CODE
