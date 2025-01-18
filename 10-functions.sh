#!/bin/bash

ID=$(id -u)

VALIDATE(){
    ID=$(id -u)

  if  [ $1 -ne 0 ]
  then
        echo "ERROR:: $1..........failed"

  else
      echo "$2-------------- Success"
  fi
}

if  [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"

else
    echo "you are root user"
fi

yum install mysql -y

VALIDATE $? "Installing mysql"

yum install git -y

VALIDATE $? "Installing Git"