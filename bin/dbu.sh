#!/bin/bash
## ~/dockery/bin/dbu.sh
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