#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
    echo "ERROR: User must have root access to execute this command"
    exit 1
fi

VALIDATE () {
    if [ $1 -ne 0 ]
    then
        echo " $2 ... Failure"
        exit 1
    else 
        echo "$2 ... Success"
    fi

}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else
    echo "Mysql is already ... Installed"



