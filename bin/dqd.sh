#!/bin/bash
## ~/dockery/bin/dqd.sh
echo "Starting "   
## check script flags kill bad flags ask again to delete data
while getopts 'yn:' OPTION; do
  case "$OPTION" in
    y)
      echo "Warning: -y flag detected removing ALL data. Press <ctrl> + c to terminate." 
      ;;
    n)
      echo "-n flag skipping data removal"
      ;;
    "")
      echo "[-y] [-n] flag not set default to user prompt for data removal"
      ;;
    ?)
      echo "script flag does not exist see usage: [-y] [-n]"
      ;;
  esac
done
## dbu.sh  mkdir backup all images and routes
echo "Starting "   
echo "create directories ~/dockbkup for images and routes" 
cd $HOME && sudo mkdir -m777 ~/dockbkup ; cd ~/dockbkup && sudo mkdir -m777 img && sudo mkdir -m777 routes  
echo "Backing up..."
docker save $(docker images -q) -o ~/dockbkup/img/dockerimages`date +%d%b%Y`.tar ; iptables-save > ~/dockbkup/img/savedrules`date +%d%b%Y`.txt && echo "Images and routes backed up to ~/dockbkup/"
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error"
else
echo "Completed"
fi
while getopts 'yn:' OPTION; do
  case "$OPTION" in
    y)
      echo "*-y flag clearing docker*"
      ## dcl.sh clear docker stop containers remove images prune network and volumes
      docker container stop $(docker container ls -aq) && docker container rm -f $(docker container ls -aq) && docker rmi -f $(docker images -aq) && docker volume prune && docker network prune && echo "...cleared!" ; docker ps
      retVal=$?
      if [ $retVal -ne 0 ]; then
      echo "Error"
      else
      echo "Completed"
      fi
      fi
      ;;
    n)
      echo "*-n flag skipping docker clear*"
      ;;
    "")
      echo "Continue clearing docker? y/n" ; read answer1
      if [[ ( $answer1 == "n" ) ]]; then
      echo "*user skip docker clear*"
      else
      echo "Starting " && echo "Clearing docker do you wish to continue? y/n" && read abort1
      if [[ ( $abort1 == "n" ) ]]; then
      echo "good bye."
      else
      echo "*User requested docker clear.*"
      ## dcl.sh clear docker stop containers remove images prune network and volumes
      docker container stop $(docker container ls -aq) && docker container rm -f $(docker container ls -aq) && docker rmi -f $(docker images -aq) && docker volume prune && docker network prune && echo "...cleared!" ; docker ps
      retVal=$?
      if [ $retVal -ne 0 ]; then
      echo "Error"
      else
      echo "Completed"
      fi
      fi
      ;;
    ?)
      echo "script flag does not exist see usage: [-y] [-n]"
      ;;
  esac
done
while getopts 'yn:' OPTION; do
  case "$OPTION" in
    y)
      ## ddn.sh using quick install see https://getdocker.com for full install apt refresh reinstall docker add $USER to group docker enable systemctl
      echo "*-y flag selected docker nuke* - nuking docker..." ; sudo dpkg -l | grep -i docker ; sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin && sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-compose-plugin && sudo rm -rf /var/lib/docker /etc/docker && sudo rm /etc/apparmor.d/docker && sudo groupdel docker && sudo rm -rf /var/run/docker.sock && echo "...nuked!!!" 
      retVal=$?
      if [ $retVal -ne 0 ]; then
      echo "Error"
      else
      echo "Completed"
      fi
      fi
      echo "returned "$retVal
      ;;
    n)
      echo "*-n flag skipping docker nuke and reinstall*"
      ;;
    "")
      ## ~/dockery/bin/drm.sh
      echo "Starting "   
      echo "Continue docker nuke and reinstall? y/n" && read answer2
      if [[ ( $answer2 == "n" ) ]]; then
      echo "*no nuke for you!*"
      else
      ## ddn.sh using quick install see https://getdocker.com for full install apt refresh reinstall docker add $USER to group docker enable systemctl
      echo "*user selected docker nuke* - nuking docker..." ; sudo dpkg -l | grep -i docker ; sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin && sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-compose-plugin && sudo rm -rf /var/lib/docker /etc/docker && sudo rm /etc/apparmor.d/docker && sudo groupdel docker && sudo rm -rf /var/run/docker.sock && echo "...nuked!!!" 
      retVal=$?
      if [ $retVal -ne 0 ]; then
      echo "Error"
      else
      echo "Completed"
      fi
      fi
      echo "returned "$retVal
      ;;
    ?)
      echo "script flag does not exist see usage: [-y] [-n]"
      ;;
  esac
done
## ~/dockery/bin/dhi.sh
echo "Starting "  
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
echo "returned "$retVal