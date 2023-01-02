#!/bin/bash
## ~/dockery/bin/dhi.sh
echo "Starting " $(basename) 
## dhi.sh - docker hello world
echo "Hello-world starting rn..."
docker run hello-world
echo "Status update?"
read status
if [[ ( $status == "n" ) ]]; then
echo "good-bye"
else
## dok.sh - docker install status check
docker ps && docker images && docker volume ls && docker networks ls && sudo iptables -L  
if [ $? -eq 0 ] 
then 
  echo "docker check AOK - happy dockering!' 
else 
  echo "docker failed status check error status return for dhi.sh script" >&2 
fi
