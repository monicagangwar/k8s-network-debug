#!/bin/bash
SECONDS=0
duration=''
service='kubernetes.default'
output=0
for i in {1..10}
do
    ping -W 1 -c 1 $service
    output=`echo $?`
    if [[ $output == 1 ]]; then
        duration=$SECONDS
        echo "iteration $i: ping $service -> success."
        break
    else
        duration=$SECONDS
        echo "iteration $i: ping $service -> failed."
    fi
    sleep 1
done

time_taken="$(($duration / 60)) minutes and $(($duration % 60)) seconds"

if [[ $output == 1 ]]; then
    echo "Network setup in $time_taken."
    exit 0
else
    echo "All attempts exhausted. Pod network not setup in $time_taken."
    exit 1
fi
