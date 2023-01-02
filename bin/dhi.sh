#!/bin/bash
## ~/dockery/bin/dhi.sh
echo "Starting " $(basename)
## dck.sh - docker hello world
echo "Hello-world status starting rn..." ; docker run hello-world ; echo "Run status update?" ; read status
if [[ ( $status == "n" ) ]]; then
echo "good-bye"
else
echo "checking..." ; docker ps && docker images && docker volume ls && docker network ls && sudo iptables -L
fi
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error"
else
echo "Completed"
fi
echo $basename
exit $retVal
