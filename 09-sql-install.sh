#!/bib/bash

ID=$(id -u)

if  [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"

else
    echo "you are root user"
fi

yum install mysql -y

if [ $? -ne 0 ] 
then 
    echo " ERROR:: Installing  Git is failed"
    exit 1

else
    echo "Installing git is success"
fi

yum install gitt -y

if [ $? -ne 0 ]
then 
    echo "Error:: Intalling Git is failed"
else
    echo "erro:: Installing Git is success"
fi