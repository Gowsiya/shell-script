R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_PATH=/home/ec2-user/app-logs
mkdir -p /var/log/shellscript-logs

LOGS_FOLDER=/var/log/shellscript-logs
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME=$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR: User must have root access to execute this command"
fi

echo "Script started executing at: $TIMESTAMP" >>$LOG_FILE_NAME

FILES_TO_BE_DELETED=$(find $SOURCE_PATH -name "*.log" -mtime +30)
echo "Files to be deleted: $FILES_TO_BE_DELETED"

while read -r filepath
do
    echo "Delting file: $filepath"
    rm -rf $filepath
    echo "Deleted file: $filepath" 
done <<<$FILES_TO_BE_DELETED

