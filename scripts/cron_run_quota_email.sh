#!/bin/sh

current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")

print_quotas | grep quotaPercents |grep -v "\= \[\];"|grep -v " 0.000," |grep -v "var quotaPercents" |awk '/\]\[/{sub(/.*\]\[ /, "");print}' |awk '{print $1, $5}'| cut -c 2- |sed 's/.$//'|sed 's/"//'| sed 's/"//' | awk '{ if($2 >= 99) { print } }' > /root/projects/gargoyle/output/quota_email_output.txt

if [ -s /root/projects/gargoyle/output/quota_email_output.txt ]
then
  cat /root/projects/gargoyle/config/mail_template_quota.txt > /root/projects/gargoyle/output/mail_alert_$current_date_time.txt
  print_quotas |grep quotaPercents |grep -v "\= \[\];"|grep -v " 0.000," |grep -v "var quotaPercents" |awk '/\]\[/{sub(/.*\]\[ /, "");print}' |awk '{print $1, $5}'| cut -c 2- |sed 's/.$//'|sed 's/"//'| sed 's/"//' | awk '{ if($2 >= 99) { print } }' >> /root/projects/gargoyle/output/mail_alert_$current_date_time.txt
  v_wanipaddr=`/root/scripts/get_wanipaddr.sh`
  echo "https://"$v_wanipaddr >> mail_alert_$current_date_time.txt
  cat /root/projects/gargoyle/output/mail_alert_$current_date_time.txt | msmtp agrohe21@yahoo.com
else
  rm /root/projects/gargoyle/output/quota_email_output.txt
fi



