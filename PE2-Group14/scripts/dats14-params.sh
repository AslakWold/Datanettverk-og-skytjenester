#! /bin/bash

#LB port for HTTP traffic (Had to use another port than 80 in virtualbox VM)
export LB_PORT=80

#Webservers
export WEB1_NAME=web1
export WEB2_NAME=web2
export WEB3_NAME=web3
export WEB1_HOSTNAME=web1
export WEB2_HOSTNAME=web2
export WEB3_HOSTNAME=web3

#Haproxy loadbalancer
export LB_NAME=lb
export LB_HOSTNAME=haproxy

#Database
export DB0_NAME=db0
export DB1_NAME=db1
export DB2_NAME=db2
export DB3_NAME=db3
export DB0_HOSTNAME=dbgc1
export DB1_HOSTNAME=dbgc1
export DB2_HOSTNAME=dbgc2
export DB3_HOSTNAME=dbgc3

#Database proxy
export MAXSCALE_NAME=dbproxy
export MAXSCALE_HOSTNAME=maxscale

#Alto and database users
export ALTO_USER=dats14
export ALTO_PASS="cloth cannot decide"

export MAXSCALE_USER=maxscaleuser
export MAXSCALE_PASS=maxscalepass

export ROOT_USER=root
export ROOT_PASS=rootpass


