#! /bin/bash

source dats14-params.sh

#Making the altouser and granting rights to maxscaleuser and altouser
sudo bash makeDBUser.sh \
&& sudo bash grants.sh

#Starting the db proxy
sudo bash newMaxscaleDocker.sh $MAXSCALE_NAME $MAXSCALE_HOSTNAME 