#!/bin/bash

echo "Setting timezone..."
echo 'Europe/Athens' | tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

echo ""

echo "Installing localhost ansible..."
apt-get install software-properties-common -y
apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install ansible -y
echo "localhost              ansible_connection=local" > /etc/ansible/hosts
echo
echo "Beginning provision"
sudo -u vagrant -H ansible-playbook /vagrant/provision/ansible/index.yml
