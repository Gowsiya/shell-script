USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p /var/log/shellscript-logs

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

echo "Script started executing at : $TIMESTAMP" &>>LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR: User must have root access to execute this command"
    exit 1
fi

VALIDATE () {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R Failure $N"
        exit 1
    else 
        echo -e "$2 ... $G Success $N"
    fi

}

for package in $@
do
    dnf list installed $package &>>LOG_FILE_NAME
    if [$? -ne 0]
    then
        dnf install $package &>>LOG_FILE_NAME
        validate $? Instaling$package
    else
        echo -E "$package is already ... $Y Installed $N"
    fi
done