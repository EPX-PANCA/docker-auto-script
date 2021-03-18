#!/bin/bash

#author Panca Putra Pahlawan

echo "-----------------------------------------------------"
echo "|  Auto Script Docker for Kubernetes v.0.2.1-alpha  |"
echo "|  https://github.com/EPX-PANCA/docker-auto-script  |"
echo "-----------------------------------------------------"

while getopts u:p: flag; do
    case "${flag}" in
        u) USER_SERVER=${OPTARG};;
        p) SECRET=${OPTARG};;
        
    esac
done

if [ -z "$USER_SERVER" ] || [ -z "$SECRET" ]
then
   echo "Try Again, Please Check Parameters and Arguments";
   exit 1;
fi

echo "Add Dependencies"
sudo apt install sshpass -y

MYNAME=$(sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "whoami");
echo "Download Installer"
sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S wget -N https://raw.githubusercontent.com/EPX-PANCA/docker-auto-script/main/auto-docker.sh" > /dev/null 2>&1
sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S chmod +x auto-docker.sh"
sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S ./auto-docker.sh"
sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S usermod -aG docker $MYNAME"
sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S rm auto-docker.sh" > /dev/null 2>&1
echo "Server Reboot"
sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S reboot"
