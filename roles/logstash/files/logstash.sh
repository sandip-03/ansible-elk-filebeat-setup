#!/bin/bash
#kill current logstash instance and start new

l_pid=`ps -ef|grep elk|grep java|grep logstash|grep -v grep|awk '{print $2}'`
if [ ! -z $l_pid ]
then
kill -9 $l_pid
fi

sleep 5
( ( nohup /hboprod/elk/logstash-6.1.1/bin/logstash -f /hboprod/elk/logstash-6.1.1/bin/logstash.conf 1>/dev/null 2>&1 ) & )