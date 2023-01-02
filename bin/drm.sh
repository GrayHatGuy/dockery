#!/bin/bash
## ~/dockery/bin/drm.sh
echo "Starting " $(basename) 
## check script flags kill bad flags ask again to delete data
echo "Continue docker nuke and reinstall? y/n" && read answer2
if [[ ( $answer2 == "n" ) ]]; then
echo "*user select skipping docker nuke*"
else
## ddn.sh using quick install see https://getdocker.com for full install apt refresh reinstall docker add user to group and docker to systemctl
echo "*user select docker nuke* Now nuking docker..." ; sudo dpkg -l | grep -i docker ; sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin && sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-compose-plugin sudo rm -rf /var/lib/docker /etc/docker && sudo rm /etc/apparmor.d/docker && sudo groupdel docker && sudo rm -rf /var/run/docker.sock && echo "...nuked!" ; echo "re-installing..." ; sudo apt-get update -y && sudo apt-get upgrade -y ; sudo curl -fsSL https://get.docker.com -o get-docker.sh && sudo bash get-docker.sh && sudo apt-get upgrade -y && sudo apt-get update -y ; sudo usermod -aG docker $USER ; sudo systemctl enable docker.service && sudo systemctl enable containerd.service && echo "docker installed!"
