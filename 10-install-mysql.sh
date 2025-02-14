#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: user must have the root access to execute this command"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Installing MYSQL ... Failure"
        exit 1
    else
        echo "Installing MYSQL ... SUCCESS"
    fi
else
    echo " MYSQL is already ... Installed"
fi

# dnf install mysql -y
# if [ $? -ne 0 ]
# then
#     echo "Installing MYSQL ... Failure"
#     exit 1
#  else
#     echo "Installing MYSQL ... SUCCESS"
# fi
 
dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        "Installing Git ... Failure"
        exit 
    else
        "Installing Git ... SUCCESS"
    fi
else 
    echo "Git is already ... Installed"
fi