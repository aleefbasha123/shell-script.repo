#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +F-%H-%M-%S)
LOGFILE="/temp/$0-$TIMESTAMP.log"
echo "script strated execting at "$TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    ID=$(id -u)

  if  [ $1 -ne 0 ]
  then
        echo "ERROR:: $1..........failed"

  else
      echo "$2-------------- Installaton Success"
  fi
}

if  [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"

else
    echo "you are root user"
fi

yum install mysql -y &&>> $LOGFILE

VALIDATE $? "Installing mysql"

yum install git -y &&>> $LOGFILE

VALIDATE $? "Installing Git"