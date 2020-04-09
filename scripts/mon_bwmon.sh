#!/bin/sh

if [[ "$(bw_get -i total5-upload-day-365 2>&1 | cut -c 0-125 )" ==  "ERROR: Bandwidth query failed, make sure rule with specified id exists, and that you are performing only one query at a time." ]]; then
  /etc/init.d/bwmon_gargoyle start;
  cat   /root/mail_template_bwmon.txt  | msmtp agrohe21@yahoo.com
  touch /root/bwmon_restart_$(date +"%Y-%m-%d-%H-%M-%S")
fi

