#!/bin/bash

# provisioning file for the ansible controller 

# sudo apt update -y
# sudo apt-get install tree -y
# sudo apt-add-repository --yes --update ppa:ansible/ansible
# sudo apt install ansible -y
# sudo apt install python3-pip -y
# pip3 install awscli -y
# pip3 install boto boto3 -y
# python3 -m pip install --user --upgrade pip
# python3 -m pip install ansible boto3 botocore
# sudo apt-get upgrade -y

sudo apt-get update -y

sudo apt-get install software-properties-common

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update -y

sudo apt-get install ansible -y

sudo rm -rf /etc/hosts

sudo echo "
[web]
192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant

[db]
192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant

127.0.0.1	localhost
127.0.1.1	vagrant.vm	vagrant

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
127.0.2.1 controller controller" >> /etc/hosts