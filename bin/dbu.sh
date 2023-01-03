#!/bin/bash
## ~/dockery/bin/dbu.sh
## dbu.sh  mkdir backup all images and routes
echo "Starting " $(basename) 
echo "create backup in ~/dockbkup for images and routes" ; sudo cd ~/ & mkdir /dockbkup ; cd /dockbkup && sudo mkdir img && cd .. ; mkdir routes  
docker save $(docker images -q) -o ~/dockbkup/img/dockerimages`date +%d%b%Y`.tar ; iptables-save > ~/dockbkup/img/savedrules`date +%d%b%Y`.txt && echo "Images and routes backed up to ~/dockbkup/"
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error"
else
echo "Completed"
fi
echo $basename
echo "returned "$retVal