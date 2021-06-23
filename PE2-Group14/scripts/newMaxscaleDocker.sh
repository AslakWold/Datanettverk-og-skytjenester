#! /bin/bash

docker run -d \
--name $1 \
--hostname $2 \
-p 8989:8989 \
-p 4006:4006 \
-p 4008:4008 \
-v /etc/hosts:/etc/hosts \
-v ~/volumes/$1/maxscale.cnf:/etc/maxscale.cnf:ro \
mariadb/maxscale


#Markerer existerende hosts med samme navn i /etc/hosts

sudo sed -i "/$2/d" /etc/hosts

#Legger til IP og hostnavn i /etc/hosts

ip=$(docker inspect --format "{{ .NetworkSettings.IPAddress }}" $1)
echo "$ip $2" | sudo tee -a /etc/hosts