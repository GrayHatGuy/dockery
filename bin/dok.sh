#!/bin/bash
## ~/dockery/bin/dok.sh
echo "Starting "   
## dok.sh - docker install verify status
docker ps && docker images && docker volume ls && docker network ls && sudo iptables -L  
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error"
else
echo "Completed"
fi
echo "returned "$retVal