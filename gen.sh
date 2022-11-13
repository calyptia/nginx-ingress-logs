#!/bin/sh

while true; do
    n=`awk -v min=5 -v max=20 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
    for var in `seq 1 $n`;
    do
	ip1=`cat ./ip.txt | shuf -n 1`
        ip2=`cat ./ip.txt | shuf -n 1`
	ts=`date +"[%d/%b/%Y:%k:%M:%S %z]"`
	uri=`cat ./words.txt | shuf -n 1`
	status=`cat ./status.txt | shuf -n 1`
	#echo "${ip} - - ${ts} \"GET /${uri} HTTP/1.0\" ${status} 2216"
        echo "${ip1} - - ${ts} \"POST /${uri} HTTP/1.1\" ${status} 34152 \"-\" \"Go-http-client/1.1\" 308 7.234 [redacted-http] [] ${ip2}:8080 34152 7.232 200"
    done
    sleep 1;
done
