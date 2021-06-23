#! /bin/bash

source dats14-params.sh

docker exec -it $DB1_NAME mysql -u$ROOT_USER -p$ROOT_PASS -e \
"GRANT ALL PRIVILEGES ON *.* TO '$ALTO_USER'"

docker exec -it $DB1_NAME mysql -u$ROOT_USER -p$ROOT_PASS -e \
"GRANT SELECT ON *.* TO '$MAXSCALE_USER'"

docker exec -it $DB1_NAME mysql -u$ROOT_USER -p$ROOT_PASS -e \
"GRANT SHOW DATABASES ON *.* TO '$MAXSCALE_USER'"
