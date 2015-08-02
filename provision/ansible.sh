#!/bin/bash

echo "Installing local ansible..."
apt-get install software-properties-common -y
apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install ansible -y

echo ""
echo "Configuring ansible..."
echo "localhost              ansible_connection=local" > /etc/ansible/hosts