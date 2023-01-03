#!/bin/bash
## ~/dockery/bin/dok.sh
echo "Starting " $(basename) 
## dok.sh - docker install verify status
docker ps && && docker images && docker volume ls && docker networks ls && sudo iptables -L  
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error"
else
echo "Completed"
fi
echo $basename
echo "returned "$retVal