#!/bin/bash

SOURCE_DIRECTORY=/tem/app-log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $SOURCE_DIRECTORY ]
then
     echo -e "$G Sourece directory exists $N"
else
    echo -e "$R Please make sure  $SOURCE_DIRECTORY exists $N"
fi

FILES=$(fine $SOURCE_DIRECTORY -name "*.log" -mtime +14)
echo "File to delete:$FILES"

while  IFS read -r line #IFS Internal filed seperater
do
  echo "deleting file:$line"
  rm -rf $line
done <<< $FILES