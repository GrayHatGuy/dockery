#!/bin/bash
## ~/dockery/bin/ddn.sh
echo "Starting " $(basename) 
echo "re-installing..." ; sudo apt-get update -y && sudo apt-get upgrade -y ; sudo curl -fsSL https://get.docker.com -o get-docker.sh && sudo bash get-docker.sh && sudo apt-get upgrade -y && sudo apt-get update -y ; sudo usermod -aG docker $USER ; sudo systemctl enable docker.service && sudo systemctl enable containerd.service && echo "docker installed!"
