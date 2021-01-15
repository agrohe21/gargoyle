#!/bin/ash

. /root/.profile
source /root/.profile

#endless loop, will print the message every X seconds as indicated in the $wait_sec variable

if [ "$1" = '' ]; then
   wait_sec="58"
else
   wait_sec="$1"
fi

#while [ 1 ]; do
  while [ ! $(date +"%S") -eq '00' ]; do
    #echo Not Zero
    #echo $(date +"%Y-%m-%d-%H-%M-%S")
   sleep 1
  done

  current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")
  echo "Starting Gargoyle upload to AWS: "$(date +"%Y-%m-%d-%H-%M-%S")
  logger -t upload_aws "Starting Gargoyle upload to AWS: "$(date +"%Y-%m-%d-%H-%M-%S")
  
  #bw-minute
  for f in /root/projects/gargoyle/output/bw-minute-20* ;  do
    if [ -f "$f" ]; then
      #ls -altrh $f
      ls $f
      arrFile=`echo $f | awk '{split($0,a,"/"); print a[6]}'`
      destFile=`echo $arrFile | cut -c 11-`
      echo $destFile.bwm
      /root/.local/bin/aws s3 mv $f s3://agrohe21-gargoyle-files/$destFile.bwm
    fi
  done

  #bw-hour
  for f in /root/projects/gargoyle/output/bw-hour-20* ;  do
    if [ -f "$f" ]; then
      #ls -altrh $f
      ls $f
      arrFile=`echo $f | awk '{split($0,a,"/"); print a[6]}'`
      destFile=`echo $arrFile | cut -c 9-`
      #echo $destFile.bwh
      /root/.local/bin/aws s3 mv $f s3://agrohe21-gargoyle-files/$destFile.bwh
    fi
  done

  #bw-day
  for f in /root/projects/gargoyle/output/bw-day-20* ;  do
    if [ -f "$f" ]; then
      #ls -altrh $f
      ls $f
      arrFile=`echo $f | awk '{split($0,a,"/"); print a[6]}'`
      destFile=`echo $arrFile | cut -c 8-`
      #echo $destFile.bwd
      /root/.local/bin/aws s3 mv $f s3://agrohe21-gargoyle-files/$destFile.bwd
    fi
  done

  #bw-month
  for f in /root/projects/gargoyle/output/bw-month-20* ;  do
    if [ -f "$f" ]; then
      #ls -altrh $f
      ls $f
      arrFile=`echo $f | awk '{split($0,a,"/"); print a[6]}'`
      destFile=`echo $arrFile | cut -c 10-`
      #echo $destFile.bwo
      /root/.local/bin/aws s3 mv $f s3://agrohe21-gargoyle-files/$destFile.bwo
    fi
  done

  #connection
  for f in /root/projects/gargoyle/output/conn-20* ;  do
    if [ -f "$f" ]; then
      #ls -altrh $f
      ls $f
      arrFile=`echo $f | awk '{split($0,a,"/"); print a[6]}'`
      destFile=`echo $arrFile | cut -c 6-`
      #echo $destFile.conn
      /root/.local/bin/aws s3 mv $f s3://agrohe21-gargoyle-files/$destFile.conn
    fi
  done

  echo "Finished Gargoyle Upload to AWS: "$(date +"%Y-%m-%d-%H-%M-%S")
  logger -t upload_aws "Finished Gargoyle Upload to AWS: "$(date +"%Y-%m-%d-%H-%M-%S")

  #sleep $wait_sec
#done

exit $?
