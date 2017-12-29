#!/bin/bash
#kill current filebeat instance and start new

f_pid=`ps -ef|grep elk|grep filebeat.yml|grep -v grep|awk '{print $2}'`
if [ ! -z $f_pid ]
then
kill -9 $f_pid
fi

sleep 10
( ( nohup /hboprod/elk/filebeat-6.1.1-linux-x86_64/filebeat -e -c /hboprod/elk/filebeat-6.1.1-linux-x86_64/filebeat.yml 1>/dev/null 2>&1 ) & )