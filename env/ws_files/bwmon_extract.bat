cd c:/Users/andgrohe/Projects/gargoyle/env/ws_files
REM call %CD%/kitchen.bat /norep /file:c:/Users/andgrohe/Projects/gargoyle/content/public/gargoyle/run_bwmon_gather.kjb /level:Detailed /logfile:c:/Users/andgrohe/Projects/gargoyle/output/bandwidth_gather.log
call %CD%/kitchen.bat /norep /file:c:/Users/andgrohe/Projects/gargoyle/content/public/gargoyle/run_bwmon_gather.kjb /level:Basic
echo Error:%ERRORLEVEL%