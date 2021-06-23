#! /bin/bash

if [ $# -lt 2 ]
then
        echo error
        exit
fi

docker run \
 --name $1 \
 --hostname $2 -P -d \
 -v ~/volumes/$1/html:/var/www/html \
 -v /etc/hosts:/etc/hosts \
 richarvey/nginx-php-fpm

#Fjerner existerende hosts med samme navn i /etc/hosts

sudo sed -i "/$2/d" /etc/hosts


#Legger til IP og hostnavn i /etc/hosts

ip=$(docker inspect --format "{{ .NetworkSettings.IPAddress }}" $1)
echo "$ip $2" | sudo tee -a /etc/hosts