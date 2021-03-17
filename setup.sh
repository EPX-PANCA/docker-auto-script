#!/bin/bash

#author Panca Putra Pahlawan

while getopts u:s: flag
do
    case "${flag}" in
        u) USER_SERVER=${OPTARG};;
        s) SECRET=${OPTARG};;
    esac
done

sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S wget https://raw.githubusercontent.com/EPX-PANCA/K8S/main/auto-setup-docker.sh"
sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S chmod 600 auto-setup-docker.sh"
sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S ./auto-setup-docker.sh"
