#!/bin/bash

ID=$(id -u)

VALIDATE(){
    ID=$(id -u)

  if  [ $ID -ne 0 ]
  then
        echo "ERROR:: Please run this script with root access"

  else
      echo "you are root user"
  fi
}

if  [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"

else
    echo "you are root user"
fi

yum install mysql -y

VALIDATE

yum install git -y

VALIDATE