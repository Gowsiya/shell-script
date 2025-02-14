#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then
    echo "ERROR: user must have the root access to execute the command"
    
dnf install mysql -y