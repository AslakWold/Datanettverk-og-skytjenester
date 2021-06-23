#! /bin/bash

source dats14-params.sh

cp -r ./../webapp/phpcode/* ~/volumes/$WEB1_NAME/html/
cp -r ./../webapp/phpcode/* ~/volumes/$WEB2_NAME/html/
cp -r ./../webapp/phpcode/* ~/volumes/$WEB3_NAME/html/

cp -r ./../webapp/database/* ~/volumes/$DB1_NAME/datadir/
