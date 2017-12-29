#!/bin/bash
#kill current elastic serach instance and start new

e_pid=`ps -ef|grep elk|grep java|grep elasticsearch|grep -v grep|awk '{print $2}'`
if [ ! -z $e_pid ]
then
kill -9 $e_pid
fi

sleep 5

( ( nohup /hboprod/elk/elasticsearch-6.1.1/bin/elasticsearch 1>/dev/null 2>&1 ) & )