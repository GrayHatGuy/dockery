

## dhi.sh - docker hello world
echo "Hello-world starting rn..."
docker run hello-world 
## dok.sh - docker install status check
docker ps && && docker images && docker volume ls && docker networks ls && sudo iptables -L  
if [ $? -eq 0 ] 
then 
  echo "docker is good to go!'" 
else 
  echo "docker failed status check error status return for dhi.sh script" >&2 
fi
