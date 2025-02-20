#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=5

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{PRINT $6F}')
    PARTITION=$(echo $line | awk -F " " '{PRINT $NF}')
    echo "partition : $PARTITION , usage : $USAGE"
done <<< $DISK_USAGE