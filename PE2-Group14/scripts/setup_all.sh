#! /bin/bash


source dats14-params.sh

#Adding all the hosts to /etc/hosts
#sudo bash addHosts.sh

#Creating the directories
sudo bash directoryStructure.sh

#Installing docker
sudo bash dockerInstall.sh

#Installing docker images
sudo bash pullImages.sh

#Making the config files and putting them in the right directories
sudo bash mkLbCfg.sh
sudo bash mkDbMyCnf.sh
sudo bash mkMaxscaleCnf.sh

#Changing the user and password variables in dbconnections.php
sudo bash changeDBconnectionsVariables.sh

#Starting the webservers and the haproxy loadbalancer
sudo bash webSetup.sh

#Setting up the Galera Cluster and the Database Proxy
sudo bash clusterSetup.sh

#moving the webapps and the database dump to the correct folders
sudo bash moveAppInfo.sh

#Running the database dump to create the database studentinfo
sudo bash setupStudentinfo.sh

#Starting maxscale dbproxy
sudo bash maxscaleSetup.sh
