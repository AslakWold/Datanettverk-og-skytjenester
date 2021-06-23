#! /bin/bash

#Updating
apt-get update -y 

#Removing docker if it is installed
apt-get remove -y docker docker-engine docker.io

#Installing Docker
apt-get install -y docker.io

#Setting up
systemctl start docker \
&& systemctl enable docker
