#!/bin/bash

#author Panca Putra Pahlawan

USER_SERVER=
SECRET=

sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S wget https://raw.githubusercontent.com/EPX-PANCA/K8S/main/auto-setup-docker.sh"
sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S chmod 600 auto-setup-docker.sh"
sshpass -p $SECRET ssh -o StrictHostKeyChecking=no $USER_SERVER "echo "$SECRET" | sudo -S ./auto-setup-docker.sh"
