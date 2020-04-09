#!/bin/sh
BEGIN INIT INFO
# Provides: mon_gargoyle
# Required-Start: postgresql
# Required-Stop: postgresql
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Description: Monitor Gagoyle Router
### END INIT INFO

case "$1" in
"start")
su agrohe21 -lc "/home/agrohe21/projects/gargoyle/env/ws_files/mon_gargoyle.sh"
;;
"stop")
su agrohe21 -lc "/home/agrohe21/projects/gargoyle/env/ws_files/stop_mon_gargoyle.sh && rm -f /home/agrohe21/projects/gargoyle/config/gargoyle.pid"
;;
*)
echo "Usage: $0 { start | stop }"
;;
esac
exit 0
