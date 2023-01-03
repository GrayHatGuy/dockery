#!/bin/bash
## ~/dockery/bin/drm.sh
echo "Starting " $(basename) 
echo "Continue docker nuke and reinstall? y/n" && read answer2
if [[ ( $answer2 == "n" ) ]]; then
echo "*no nuke for you!*"
else
## ddn.sh using quick install see https://getdocker.com for full install apt refresh reinstall docker add $USER to group docker enable systemctl
echo "*user selected docker nuke* - nuking docker..." ; sudo dpkg -l | grep -i docker ; sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin && sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-compose-plugin sudo rm -rf /var/lib/docker /etc/docker && sudo rm /etc/apparmor.d/docker && sudo groupdel docker && sudo rm -rf /var/run/docker.sock && echo "...nuked!!!" 
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error"
else
echo "Completed"
fi
echo $basename
echo "returned "$retVal