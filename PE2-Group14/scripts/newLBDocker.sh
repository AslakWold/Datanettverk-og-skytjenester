#! /bin/bash

source dats14-params.sh

docker run \
 --name $1 \
 --hostname $2 \
 -p $LB_PORT:80 -d \
 -v ~/volumes/$1/haproxy:/usr/local/etc/haproxy:ro \
 -v /etc/hosts:/etc/hosts \
 haproxy

#Markerer existerende hosts med samme navn i /etc/hosts

sudo sed -i "/$2/d" /etc/hosts

#Legger til IP og hostnavn i /etc/hosts

ip=$(docker inspect --format "{{ .NetworkSettings.IPAddress }}" $1)
echo "$ip $2" | sudo tee -a /etc/hosts