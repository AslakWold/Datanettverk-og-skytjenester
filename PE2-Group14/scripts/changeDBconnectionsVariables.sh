#! /bin/bash

source dats14-params.sh

 sed -i "s/\$user = \"??????\";/\$user = \"$ALTO_USER\";/g" ./../webapp/phpcode/include/dbconnection.php
 sed -i "s/\$passwd = \"??????\";/\$passwd = \"$ALTO_PASS\";/g" ./../webapp/phpcode/include/dbconnection.php
 sed -i "s/\$host = \"??????\";/\$host = \"$MAXSCALE_HOSTNAME\";/g" ./../webapp/phpcode/include/dbconnection.php
