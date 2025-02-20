#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=5

while read -r line
do
    echo $line
done <<< $DISK_USAGE