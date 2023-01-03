#!/bin/bash
## ~/dockery/bin/dqd.sh
echo "Starting " $(basename) 
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
      echo "script flag does not exist see usage: $(basename \$0) [-y] [-n]" >&2
      ;;
  esac
done
## dbu.sh  mkdir backup all images and routes
echo "create backup directory in ~/dockbkup for images and routes" ; sudo cd ~/ & mkdir /dockbkup ; cd /dockbkup && sudo mkdir img && cd .. ; mkdir routes ; docker save $(docker images -q) -o ~/dockbkup/img/dockerimages`date +%d%b%Y`.tar ; iptables-save > ~/dockbkup/img/savedrules`date +%d%b%Y`.txt && echo "Images and routes are backed up to ~/dockbkup/"
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error"  
else
echo "Completed"
fi
while getopts 'yn:' OPTION; do
  case "$OPTION" in
    y)
      ## dcl.sh clear docker stop containers remove images prune network and volumes
      echo "*-y flag clearing docker...*" ; docker container stop $(docker container ls -aq) && docker container rm -f $(docker container ls -aq) && docker rmi -f $(docker images -aq) && docker volume prune && docker network prune && echo "...cleared!" ; docker ps
      retVal=$?
      if [ $retVal -ne 0 ]; then
      echo "Error"
      else
      echo "Completed"
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
      echo "user clearing docker..." ; docker container stop $(docker container ls -aq) && docker container rm -f $(docker container ls -aq) && docker rmi -f $(docker images -aq) && docker volume prune && docker network prune && echo "...cleared!" ; docker ps
      retVal=$?
      if [ $retVal -ne 0 ]; then
      echo "Error" 
      else
      echo "Completed"
      fi
      fi
      ;;
    ?)
      echo "script flag does not exist see usage: $(basename \$0) [-y] [-n]" >&2
      ;;
  esac
done
## ddn.sh using quick install see https://getdocker.com for full install apt refresh reinstall docker add user to group and docker to systemctl
while getopts 'yn:' OPTION; do
  case "$OPTION" in
    y)
      echo "*-y flag docker nuke and reinstall*" ; echo "nuking docker..." ; sudo dpkg -l | grep -i docker ; sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin && sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-compose-plugin sudo rm -rf /var/lib/docker /etc/docker && sudo rm /etc/apparmor.d/docker && sudo groupdel docker && sudo rm -rf /var/run/docker.sock && echo "...nuked! Now re-installing..." ; sudo apt-get update -y && sudo apt-get upgrade -y ; sudo curl -fsSL https://get.docker.com -o get-docker.sh && sudo bash get-docker.sh && sudo apt-get upgrade -y && sudo apt-get update -y ; sudo usermod -aG docker $USER ; sudo systemctl enable docker.service && sudo systemctl enable containerd.service && echo "docker installed!"
      retVal=$?
      if [ $retVal -ne 0 ]; then
      echo "Error"
      else
      echo "Completed"
      fi
      ;;
    n)
      echo "*-n flag skipping docker nuke and reinstall*"
      ;;
    "")
      echo "Continue docker nuke and reinstall? y/n" && read answer2
      if [[ ( $answer2 == "n" ) ]]; then
      echo "*user select skipping docker nuke*"
      else
      ## ddn.sh using quick install see https://getdocker.com for full install apt refresh reinstall docker add user to group and docker to systemctl
      echo "*user select docker nuke* Now nuking docker..." ; sudo dpkg -l | grep -i docker ; sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin && sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-compose-plugin sudo rm -rf /var/lib/docker /etc/docker && sudo rm /etc/apparmor.d/docker && sudo groupdel docker && sudo rm -rf /var/run/docker.sock && echo "...nuked!" ; echo "re-installing..." ; sudo apt-get update -y && sudo apt-get upgrade -y ; sudo curl -fsSL https://get.docker.com -o get-docker.sh && sudo bash get-docker.sh && sudo apt-get upgrade -y && sudo apt-get update -y ; sudo usermod -aG docker $USER ; sudo systemctl enable docker.service && sudo systemctl enable containerd.service && echo "docker installed!"
      retVal=$?
      if [ $retVal -ne 0 ]; then
      echo "Error" 
      else
      echo "Completed"
      fi
      fi
      ;;
    ?)
      echo "script flag does not exist see usage: $(basename \$0) [-y] [-n]" >&2
      ;;
  esac
done
## Run hello-world default docker
echo "Hello-world starting rn..."
docker run hello-world 
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error" 
else
echo "Completed"
fi
## dok.sh - docker install status check
docker ps && docker images && docker volume ls && docker networks ls && sudo iptables -L  
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error"
else
echo "Completed"
fi
echo $basename 
echo returned $retVal 