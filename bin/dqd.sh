#!/bin/bash
echo "Enter Your Name"
read name
echo "Welcome $name to LinuxHint"
## dockery - bash scripts for improving docker workflows
	## dbu.sh 
	## make backup directory in ~/ for images and routes
	cd ~/ & mkdir /dockbkup ; cd /dockbkup && mkdir img && cd .. ; mkdir routes 
	## save images
	docker save $(docker images -q) -o ~/dockbkup/img/dockerimages`date +%d%b%Y`.tar
	## save routes
	iptables-save > ~/dockbkup/img/savedrules`date +%d%b%Y`.txt 
	## dcl.sh
	## clear docker
	docker container stop $(docker container ls -aq) && docker container rm -f $(docker container ls -aq) && docker rmi -f $(docker images -aq) && docker volume prune && docker network prune
	## drm.sh 
	## Remove everything docker 
	sudo dpkg -l | grep -i docker ; sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin && sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-compose-plugin sudo rm -rf /var/lib/docker /etc/docker && sudo rm /etc/apparmor.d/docker && sudo groupdel docker && sudo rm -rf /var/run/docker.sock
	## ddn.sh
	## quick install see https://getdocker.com for full install
	curl -fsSL https://get.docker.com -o get-docker.sh
	## dck.sh
	## check install versions upgrade
	docker compose version && docker version
	sudo apt-get upgrade -y && sudo apt-get update -y
	## dhi.sh
	hello world 
