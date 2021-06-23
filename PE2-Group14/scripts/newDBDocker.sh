#! /bin/bash

source dats14-params.sh

if [ $# -lt 2 ]
then
        echo error
        exit
fi

docker run -d \
 --name $1 \
 --hostname $2 \
 --publish "3306" \
 --publish "4444" \
 --publish "4567" \
 --publish "4568" \
 --env MYSQL_ROOT_PASSWORD="$ROOT_PASS" \
 -v ~/volumes/$1/datadir:/var/lib/mysql \
 -v ~/volumes/$1/conf.d:/etc/mysql/mariadb.conf.d \
 -v /etc/hosts:/etc/hosts \
 mariadb:10.4 \
 --wsrep_cluster_address=gcomm://$DB1_HOSTNAME,$DB2_HOSTNAME,$DB3_HOSTNAME \
 --wsrep_sst_auth="$ROOT_USER:$ROOT_PASS" \
 --wsrep_node_address=$2

#Markerer existerende hosts med samme navn i /etc/hosts

sudo sed -i "/$2/d" /etc/hosts

#Legger til IP og hostnavn i /etc/hosts

ip=$(docker inspect --format "{{ .NetworkSettings.IPAddress }}" $1)
echo "$ip $2" | sudo tee -a /etc/hosts