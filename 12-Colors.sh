#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then
    echo "ERROR: User must have root access to execute this command"
    exit 1
fi

VALIDATE () {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R Failure"
        exit 1
    else 
        echo -e "$2 ... $G Success"
    fi

}

dnf list installed mysql 
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else
    echo -e "Mysql is already ... $Y Installed"
fi


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e "Git is already  ... $Y Installed"
fi