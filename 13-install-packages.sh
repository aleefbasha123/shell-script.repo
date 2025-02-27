#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started    exceduing at $TIMESTAMP" &>> $LOGFILE
VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R FAILED $N"
    else
        echo -e "$2...$G Success $N"
    fi
}

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: Please run the script with root access"
    exit 1 #you can give other than 0
else
    echo "you are in root user"
fi #fi means reverse of if, including condtion end.

#echo "All the arguments passed:$@"
#git mysql postfix net-tools
#package=git for first time



for package in $@
do
  yum list installed $pacakge &>> $LOGFILE #check installed or not
  if [ $? -ne 0 ] #if not installed
  then
      yum install $package -y &>> $LOGFILE #install the package
      VALIDATE $? "Installing of $package" #validate
      else
          echo -e "$package is already installed ... $Y SKIPPING $N"

    fi
done
