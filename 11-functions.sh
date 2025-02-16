#!/bin/bash

USERID=(id -u)

if [ $USERID -eq 0 ]
then
    echo "ERROR: User must have root access to execute this command"
    exit 1
fi



