#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESOULD=5
MESSAGE=""

while IFS= read -r line
do
   USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 )
   FOLDER=$(echo $line | awk -F " " '{print $NF}')
   if [ $USAGE -ge $DISK_THRESOULD ]
   then
       MESSAGE+="$FOLDER is more than $DISK_THRESOULD, current usage: $USAGE \n"
   fi
done <<< $DISK_USAGE

echo -e "Message: $MESSAGE"

echo "$MESSAGE" | mail -s "DISK USAGE ALTERT" aleefbasha123@gmail.com


