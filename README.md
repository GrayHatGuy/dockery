# dockery

**bash script shortcuts for repetitive docker tasks to improve workflow efficiency.**

### Description
The following scripts automate routine tasks associated with docker composition and container devlepment. Basically they are transcribed from a docker cheat sheet I have been compiling. The intent of this repo is to provide a controlled list of docker shortcuts for community use.
_If you have a suggestion commit the revisions to the repo and submit a push request for review._

Scripts that _**REMOVE DATA**_ are: _dcl.sh drm.sh_ and _dqd.sh_. Images and routes **WILL** be backed up volume information _**WILL NOT**_.  To manually backup any critical volume data use these commands:
 
	docker run -v /dbdata --name dbstore ubuntu /bin/bash
	docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf ~/backup_volume.tar /dbdata
    
_The above opens a container volume /dbdata on dbstore for backup to localhost ./$HOME/ Verify the output tar location and containerID before executing._

_See [Usage]https://github.com/GrayHatGuy/dockery/blob/main/README.md#usage for flag settings requarding data removal._

### Set-up
Run script using:

	sudo bash ~/dockery/setup.sh 

### Usage
Scripts can be ran individually or in custom sequences.  

**To run scripts #1 to #5 separately use the form below.**
_Script #1 dbu.sh shown as an example._

	sudo ./dbu.sh ## short hand
	
_If the above short hand syntax fails confirm installation was performed per setup.sh and verify that ~/dockery/bin is added to $PATH otherwise try the following syntax with a literal path:_
	
	sudo bash /$HOME/dockery/bin/dbu.sh ## literal path
	
**To run the all scripts in sequence per dqd.sh use the following syntax for data removal prompts:**

Omitted flag - Prompt user before data removal [""]
	
	sudo ./ddq.sh ## short hand
	
OR
	
	sudo bash ~/dockery/dqd.sh ## literal path
	
Yes flag - Accept data removal without prompts [-y]
	
	sudo ./ddq.sh -y ## short hand
	
OR
	
	sudo bash ~/dockery/dqd.sh -y ## literal path
	
No flag - Bypass data removal and prompts [-n]
	
	sudo bash ./dqd.sh -n ## short hand
	
OR

	sudo bash ~/dockery/dqd.sh -n ## literal path
	
### Description
#### Discrete scripts
- **_dbu.sh_** - #1 Backup all images and ifconfig routes to ~/dockbkup/
- **_dcl.sh_** - #2 Cleans docker removes containers images then prunes network and volumes.
	**_WARNING: Data will be removed in this process!_**
- **_drm.sh_** - #3 Removes **ALL** things docker including installation. **_WARNING: Data will be removed in this process!_**
- **_ddn.sh_** - #4 Quick install script for docker. Alternate full install manually at http://getdocker.com.
- **_dck.sh_** - #5 Check docker engine and compose versions then apt update/upgrade run hello-world test then output a process list.
 
#### Sequential scripts
- **_dqd.sh_** - #1 to #5  _**god mode**_ executes all scripts {*.sh(i) for i = 1 to n; where n =5} in order listed above. Ideal for a factory reset and install of docker. **_WARNING: Data will be removed in this process!_**


_For explicit details on the commands used in scripts see embedded comments in /bin/<script>.sh_
