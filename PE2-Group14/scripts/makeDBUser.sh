#! /bin/bash

source dats14-params.sh

docker exec -it $DB1_NAME mysql -u$ROOT_USER -p$ROOT_PASS -e \
"CREATE USER '$ALTO_USER'@'%' IDENTIFIED BY '$ALTO_PASS'"
