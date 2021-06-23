#! /bin/bash

source dats14-params.sh

echo "global
	daemon
	maxconn 256

defaults
	mode http
	timeout connect 5000ms
	timeout client 50000ms
	timeout server 50000ms

frontend http-in
	bind *:80
	mode http
	default_backend servers

backend servers
	mode http
	balance roundrobin
	option httpchk HEAD /
	server $WEB1_NAME $WEB1_HOSTNAME:80 check 
	server $WEB2_NAME $WEB2_HOSTNAME:80 check
	server $WEB3_NAME $WEB3_HOSTNAME:80 check" > ~/volumes/$LB_NAME/haproxy/haproxy.cfg
