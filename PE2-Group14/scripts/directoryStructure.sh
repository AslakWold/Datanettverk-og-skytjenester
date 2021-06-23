#! /bin/bash

source dats14-params.sh

#Directory structure for the webservers
mkdir -p ~/volumes/$WEB1_NAME/html
mkdir -p ~/volumes/$WEB2_NAME/html
mkdir -p ~/volumes/$WEB3_NAME/html

#Directory structure for the haproxy loadbalancer
mkdir -p ~/volumes/$LB_NAME/haproxy

#Directory structure for the databases
mkdir -p ~/volumes/$DB1_NAME/conf.d
mkdir -p ~/volumes/$DB2_NAME/conf.d
mkdir -p ~/volumes/$DB3_NAME/conf.d
mkdir -p ~/volumes/$MAXSCALE_NAME/

#Directory for scripts and the webapp is in the PE2-Group folder already        


