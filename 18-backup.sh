R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-4}

mkdir -p /var/log/shellscript-logs

LOGS_FOLDER=/var/log/shellscript-logs
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USAGE () {
    echo " USAGE :: backup <SOURCE_DIR> <DEST_DIR> <Days(optional)>"
    exit 1
}


if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d "$SOURCE_DIR" ]
then
    echo "$SOURCE_DIR doesn't exist ... Please check"
    exit
fi

if [ ! -d "$DEST_DIR" ]
then
    echo "$DEST_DIR doesn't exist ... Please check"
    exit
fi

echo "Script started executing at: $TIMESTAMP"

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ]
then
    echo "Files are: $FILES"
    ZIP_FILE="$SOURCE_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo "succesfully compressed the files older than $DAYS"
        while read -r filepath
        do
            echo "Deleting file: $filepath"
            rm -rf $filepath
            echo "Deleted files: $filepath"
        done <<< $FILES
    else
            echo -e "$R Error:: $N Failed to create ZIP file"
            exit 1
        fi

else
    echo "No files found older than $DAYS"
fi

