#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: user must have the root access to execute this command"
    exit 1
fi
dnf install mysql -y