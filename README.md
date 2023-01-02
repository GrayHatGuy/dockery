# dockery

**bash script shortcuts of repetitive docker tasks to improve workflow efficiency.**

### Description

The following scripts automate routine tasks associated with docker composition and container devlepment. Basically they are transcribed from a docker cheat sheet I have been compiling. The intent of this repo is to provide a controlled list of docker shortcuts for community use. If you have a suggestion add it to the repo and submit a push request for review.

Scripts that _**REMOVE DATA**_ are: dcl.sh drm.sh and dqd.sh. Images and routes **WILL** be backed up volume information _**WILL NOT**_.  To manually backup any critical volume data use these commands:
 
	docker run -v /dbdata --name dbstore ubuntu /bin/bash
	docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf ~/backup_volume.tar /dbdata
    
_The above opens a container volume /dbdata on dbstore for backup to localhost ~/ Update with the input container you are backing up and the output tar location._

### Set-up

Run script using:

	sudo bash ~/dockery/setup.sh

### Script usage and descriptions

#### Usage
To run scripts #1 to #5 separately use the form. Using #1 dbu.sh as example.

	sudo ./dbu.sh
	
If the above short hand syntax fails confirm installation was performed per setup.sh and verify that ~/dockery/bin is added to $PATH otherwise try the following syntax with a literal path:
	
	sudo bash /$HOME/dockery/bin/dbu.sh
	
To run the all scripts in sequence per dqd.sh use the following options:
	
	sudo bash ~/dockery/dqd.sh [-y] [-n]
	sudo bash ~/dockery/dqd.sh [-y] [-n]
	sudo bash ~/dockery/dqd.sh [-y] [-n] 
	
### Description

dbu.sh - #1 Backup all images and ifconfig routes to ~/dockbkup/

dcl.sh - #2 Cleans docker removes containers images then prunes network and volumes.
	**_WARNING: Data will be removed in this process!_**

drm.sh - #3 Removes **ALL** things docker including installation. **_WARNING: Data will be removed in this process!_**

ddn.sh - #4 Quick install script for docker. Alternate full install manually at http://get.docker.com.

dck.sh - #5 Check docker engine and compose versions then apt update/upgrade run hello-world test then output a process list.

dqd.sh - #1 to #5 _**god mode**_ executes all scripts in order listed above. **_WARNING: Data will be removed in this process!_**
