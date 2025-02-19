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
LOG_FILE_NAME=$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log

USAGE () {
    echo " USAGE :: backup <SOURCE_DIR> <DES_DIR> <Days(optional)>
}

echo "Script started executing at: $TIMESTAMP"

if ( $# -lt 2 )
then
    USAGE
fi

