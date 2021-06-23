#! /bin/bash

source dats14-params.sh

docker exec -it $DB1_NAME mysql -u$ROOT_USER -p$ROOT_PASS -e \
"source /var/lib/mysql/studentinfo-db.sql"