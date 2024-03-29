#!/bin/bash
## ~/dockery/bin/ddn.sh
echo "Starting "   
echo "re-installing..." ; sudo apt-get update -y && sudo apt-get upgrade -y ; sudo curl -fsSL https://get.docker.com -o get-docker.sh && sudo bash get-docker.sh && sudo apt-get upgrade -y && sudo apt-get update -y ; sudo usermod -aG docker $USER ; newgrp docker; sudo chown "$USER":"$USER" /home/"$USER"/.docker -R; sudo chmod g+rwx "$HOME/.docker" -R; sudo systemctl enable docker.service && sudo systemctl enable containerd.service && echo "docker installed!"
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error"
else
echo "Completed"
fi
echo "returned "$retVal
