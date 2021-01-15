0,1,11,21,31,41,51 * * * * /usr/bin/set_kernel_timezone >/dev/null 2>&1
0 8 * * *    /usr/lib/gargoyle/email.sh
*/10 * * * * /root/projects/gargoyle/scripts/mon_bwmon.sh 2>&1
*/5 * * * * /root/projects/gargoyle/scripts/notify_hosts.sh 2>&1
#*/15 * * * * /root/projects/gargoyle/scripts/gen_metrics_web.sh 2>&1
#*/5 * * * * /root/projects/gargoyle/scripts/gen_metrics_host.sh 2>&1
*/5 * * * * /root/projects/gargoyle/scripts/gen_metrics_bwm.sh 2>&1
1 * * * * /root/projects/gargoyle/scripts/gen_metrics_bwh.sh 2>&1
1 0 * * * /root/projects/gargoyle/scripts/gen_metrics_bwd.sh 2>&1
1 0 1 * * /root/projects/gargoyle/scripts/gen_metrics_bwo.sh 2>&1
*/5 * * * * /root/projects/gargoyle/scripts/gen_metrics_conn.sh 2>&1
*/15 * * * * /root/projects/gargoyle/scripts/cron_run_test_hosts_email.sh 2>&1
0 0 * * *    /root/projects/gargoyle/scripts/cron_run_backup_settings.sh 2>&1
*/1 * * * * /root/projects/gargoyle/scripts/upload_aws.sh 2>&1
0 0,4,8,12,16,20 * * * /usr/bin/backup_quotas >/dev/null 2>&1
0 4 * * 0 sh /plugin_root/usr/lib/adblock/runadblock.sh
0 1 1 * * sh /usr/lib/gargoyle/reboot.sh
0 0,4,8,12,16,20 * * * /tmp/bw_backup/do_bw_backup.sh
0 0,4,8,12,16,20 * * * /tmp/do_webmon_backup.sh
