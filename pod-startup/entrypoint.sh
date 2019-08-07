#!/bin/bash
start_time=`date +%s`
service='kubernetes.default'
output=0
for i in {1..10}
do
    ping -W 1 -c 1 $service
    output=`echo $?`
    if [[ $output == 1 ]]; then
        echo "iteration $i: ping $service -> success."
        break
    else
       echo "iteration $i: ping $service -> failed."
    fi
    sleep 1
done
end_time=`date +%s`
time_taken=$( expr $end_time - $start_time )

echo $end_time $start_time
if [[ $output == 1 ]]; then
    echo "Network setup in $time_taken seconds."
    exit 0
else
   echo "All attempts exhausted. Pod network not setup in $time_taken seconds."
   exit 1
fi