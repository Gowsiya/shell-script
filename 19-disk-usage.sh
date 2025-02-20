#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=5

while read -r line
do
   USAGE=$(echo $line | awk -F " " '{PRINT $6F}')
   echo -e $N $USAGE
done <<< $DISK_USAGE