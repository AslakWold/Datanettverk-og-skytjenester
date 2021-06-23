#! /bin/bash

source dats14-params.sh

#Starting the webservers web1, web2 and web3
sudo bash newWebDocker.sh $WEB1_NAME $WEB1_HOSTNAME
#Waiting for the servers to fully load
sudo bash waitFor.sh "Starting server $WEB1_NAME: " 6
sudo bash newWebDocker.sh $WEB2_NAME $WEB2_HOSTNAME
sudo bash waitFor.sh "Starting server $WEB2_NAME: " 6
sudo bash newWebDocker.sh $WEB3_NAME $WEB3_HOSTNAME
sudo bash waitFor.sh "Starting server $WEB3_NAME: " 6
#Starting the Load Balancer
sudo bash newLBDocker.sh $LB_NAME $LB_HOSTNAME
#Waiting for it to fully load
sudo bash waitFor.sh "Starting haproxy Load Balancer: " 6