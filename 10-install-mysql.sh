#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: user must have the root access to execute this command"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]
    then
    echo "Installing MYSQL ... SUCCESS"
    exit 1
    else
    echo "Installing MYSQL ... Failure"
fi
echo  