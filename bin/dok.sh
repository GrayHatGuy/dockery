#!/bin/bash
## ~/dockery/bin/dok.sh
echo "Starting " $(basename) 
## dok.sh - docker install verify status
docker ps && && docker images && docker volume ls && docker networks ls && sudo iptables -L  
if [ $? -eq 0 ] 
then 
  echo "docker check AOK - happy dockering!'" 
else 
  echo "docker failed status check error status return for dok.sh script" >&2 
fi
