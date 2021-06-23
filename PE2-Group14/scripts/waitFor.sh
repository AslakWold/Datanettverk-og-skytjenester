#! /bin/bash

#Script for sleeping and displaying msg

if [ $# -lt 2 ]
then
        echo "Wrong number of parameters"
        return
fi

msg=$1
t=$(( $2/3 ))

echo -n "$1: "
for (( c=1; c<=$t; c++ ))
do
        echo -n "."
        sleep 3s
done
echo -n "OK"
echo ""