#!/bin/bash
## ~/dockery/bin/dqd.sh
echo "Starting " $(basename) 
echo "Clearing docker do you wish to continue? y/n" && read abort1
if [[ ( $abort1 == "n" ) ]]; then
echo "*user abort*"
exit 1
else
echo "*User confirmed data removal.*"
## dcl.sh clear docker stop containers remove images prune network and volumes
echo "*-y flag clearing docker...*" ; docker container stop $(docker container ls -aq) && docker container rm -f $(docker container ls -aq) && docker rmi -f $(docker images -aq) && docker volume prune && docker network prune && echo "...cleared!" ; docker ps
fi

