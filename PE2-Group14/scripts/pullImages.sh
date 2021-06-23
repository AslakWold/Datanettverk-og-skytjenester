#! /bin/bash

docker pull mariadb:10.4 \
&& docker pull mariadb/maxscale:latest \
&& docker pull haproxy:latest \
&& docker pull richarvey/nginx-php-fpm:latest 

