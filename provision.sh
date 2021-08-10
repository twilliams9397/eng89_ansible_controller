#!/bin/bash

# provisioning file for the ansible controller 

sudo apt-get update -y

sudo apt-get install software-properties-common

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update -y

sudo apt-get install ansible -y

sudo apt-get install python3-pip -y

sudo pip3 install awscli

sudo pip3 install boto boto3

sudo rm -rf /etc/ansible/hosts

sudo echo "[web]
192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant

[db]
192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant" >> /etc/ansible/hosts