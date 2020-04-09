#!/bin/sh

current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")

#For Testing
#bw_get -i bdist1-download-minute-60 | grep -v "COMBINED" | awk '{ if($2 >= 1048) { print $1,$2/1024/1024} }'     > /root/projects/gargoyle/output/download_email_output.txt
bw_get -i bdist1-download-minute-15 | grep -v "COMBINED" | awk '{ if($2 >= 1073741824) { print $1,$2/1024/1024} }' > /root/projects/gargoyle/output/download_email_output.txt

if [ -s /root/projects/gargoyle/output/download_email_output.txt ]
then
  cat /root/projects/gargoyle/config/mail_template_download.txt > "/root/projects/gargoyle/output/mail_alert_$current_date_time.txt"
 #For Testing
 #bw_get -i bdist1-download-minute-60 | grep -v "COMBINED" | awk '{ if($2 >= 1048)    { print $1,$2/1024/1024} }' >> /root/projects/gargoyle/output/mail_alert_$current_date_time.txt
  bw_get -i bdist1-download-minute-60 | grep -v "COMBINED" | awk '{ if($2 >= 1073741824) { print $1,$2/1024/1024} }' >> /root/projects/gargoyle/output/mail_alert_$current_date_time.txt
  cat /root/projects/gargoyle/output/mail_alert_$current_date_time.txt | msmtp agrohe21@yahoo.com
else
  rm /root/projects/gargoyle/output/download_email_output.txt
fi
