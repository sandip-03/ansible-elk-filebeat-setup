#!/bin/bash
#kill current kibana instance and start new

k_pid=`ps -ef|grep elk|grep kibana|grep node|grep -v grep|awk '{print $2}'`
if [ ! -z $k_pid ]
then
kill -9 $k_pid
fi

sleep 5
( ( nohup /hboprod/elk/kibana-6.1.1-linux-x86_64/bin/kibana 1>/dev/null 2>&1 ) & )