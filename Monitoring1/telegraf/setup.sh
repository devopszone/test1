#!/bin/bash

#values_file=$1


OS_Name=$(head -n 1 /etc/os-release|cut --complement -c 1-5|tr -d '"')

if [ "$OS_Name" == "Red Hat Enterprise Linux Server" ] ; then
   sudo yum install wget -y
   wget -O /home/epel-release-latest-7.noarch.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
   rpm -ivh /home/epel-release-latest-7.noarch.rpm
   sudo yum install epel-release -y
   sudo yum install ansible -y

#ansible-playbook role.yml --extra-vars @"$values_file"  
ansible-playbook role.yml -i inventory
fi

if [ "$OS_Name" == "Ubuntu" ] ; then

sudo apt-get update -y
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y 
sudo apt-get update -y
sudo apt-get install ansible -y
ansible-playbook role.yml -i inventory
 
fi 
