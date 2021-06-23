#! /bin/bash

source dats14-params.sh

#Running the Cluster DB container
sudo bash newBSDocker.sh $DB0_NAME $DB0_HOSTNAME

#Waiting for it to fully establish connections
sudo bash waitFor.sh "Running $DB0_NAME Cluster Container" 120
#sudo bash testDockerLogs.sh db0 dbgc1

#Running the db2 container
sudo bash newDBDocker.sh $DB2_NAME $DB2_HOSTNAME

#Waiting for db2 to connect
sudo bash waitFor.sh "Running $DB2_NAME Database" 12

#Running the db3 container
sudo bash newDBDocker.sh $DB3_NAME $DB3_HOSTNAME

#Waiting for db3 to connect
sudo bash waitFor.sh "Running $DB3_NAME Database" 12

#Stopping the Cluster
docker stop $DB0_NAME $DB2_NAME $DB3_NAME

#Setting safe_to_bootstrap to 1
sudo sed -i 's/safe_to_bootstrap: 0/safe_to_bootstrap: 1/' ~/volumes/$DB1_NAME/datadir/grastate.dat

#Starting db0
docker start $DB0_NAME

#Waiting for it to fully start
sudo bash waitFor.sh "Restarting $DB0_NAME" 12

#Starting db2
docker start $DB2_NAME

#Waiting for it to fully start
sudo bash waitFor.sh "Restarting $DB2_NAME" 6

#Starting db3
docker start $DB3_NAME

#Waiting for it to fully start
sudo bash waitFor.sh "Restarting $DB3_NAME" 6

#Stopping db0
sudo docker kill -s 15 $DB0_NAME

#Waiting for it to fully stop                                                                                                                                                                               sudo bash waitFor.sh "Stopping $DB0_NAME" 15
sudo bash waitFor.sh "Stopping $DB0_NAME" 6

#Replacing db0 with db1
sudo bash newDBDocker.sh $DB1_NAME $DB1_HOSTNAME

#Waiting for it to fully start
sudo bash waitFor.sh "Starting $DB1_NAME" 9
