# dockery

**bash script shortcuts for repetitive docker tasks to improve workflow efficiency during container composition.**

## Description
The following scripts automate routine tasks associated with docker composition and container devlepment. Basically they are transcribed from a docker cheat sheet I have been compiling. The intent of this repo is to provide a controlled list of docker shortcuts for community use.

_If you have suggestions for improvements commit your revisions to the repo and submit a push request for review and incorporation._

## Prerequisites
Scripts that _**REMOVE DATA**_ are: _[dcl.sh](https://github.com/GrayHatGuy/dockery/blob/main/bin/dcl.sh) [drm.sh](https://github.com/GrayHatGuy/dockery/blob/main/bin/drm.sh)_ and _[dqd.sh](https://github.com/GrayHatGuy/dockery/blob/main/bin/dqd.sh)_. 

!!!Images and routes **WILL** be backed up BUT volume information _**WILL NOT !!!**_.  

To manually backup any critical volume data use these commands:
 
	docker run -v /dbdata --name dbstore ubuntu /bin/bash
	docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf ~/backup_volume.tar /dbdata
    
_The above opens a container volume /dbdata on dbstore for backup to localhost ./$HOME/ Verify the output tar location and containerID before executing._

_See [Usage](https://github.com/GrayHatGuy/dockery/blob/main/README.md#script-flag-usage) for data removal script flagsl._

## Set-up
Creates directory for install and download repo. 
```sudo ./dbu.sh ## short hand```
OR if fail verify ~/dockery/bin is included in the path or use
```sudo bash ~/dockery/setup.sh```

## Usage
Typical use of the scripts is to execute common docker housekeeping routines for status checks, backup, clearing/sweeping, install removal/purge, and install individually or e excuted sequentially in a single script to nuke all things docker and reinstall.  The scripts make use of a simple 3-letter shell command for execution as opposed to the mulitline commands required to executed the housekeeping routines.  

#### **To run scripts #1 to #5 separately use the form below.**
_Script #1 dbu.sh shown as an example._
	
	sudo bash ./dbu.sh ## short path

##### OR	
	
	sudo bash /$HOME/dockery/bin/dbu.sh ## literal path
	
### Script flag usage
#### **To run the docker nuke sequence per dqd.sh use the following syntax for data removal prompts:**

#### Omitted flag - Prompt user before data removal [""]
	
	sudo ./ddq.sh ## short path
	
##### OR
	
	sudo bash ~/dockery/dqd.sh ## literal path
	
#### Yes flag - Accept data removal without prompts [-y]
	
	sudo ./ddq.sh -y ## short path
	
##### OR
	
	sudo bash ~/dockery/dqd.sh -y ## literal path
	
#### No flag - Bypass data removal and prompts [-n]
	
	sudo bash ./dqd.sh -n ## short path
	
##### OR

	sudo bash ~/dockery/dqd.sh -n ## literal path
	
## Details
Scripts can be ran individually or in custom sequences. 

## **!!! WARNING: ☢️ indictes data will be removed with these scripts !!!**

### Discrete scripts
- **_[dbu.sh](https://github.com/GrayHatGuy/dockery/blob/main/bin/dbu.sh)_** - #1 Backup all images and ifconfig routes to ~/dockbkup/
- ☢️ **_[dcl.sh](https://github.com/GrayHatGuy/dockery/blob/main/bin/dcl.sh)_** - #2 Cleans docker removes containers images then prunes network and volumes.
- ☢️ **_[drm.sh](https://github.com/GrayHatGuy/dockery/blob/main/bin/drm.sh)_** - #3 Nuke **ALL** things docker including installation prerequisite #2.
- **_[ddn.sh](https://github.com/GrayHatGuy/dockery/blob/main/bin/ddn.sh)_** - #4 Quick install script for docker. Alternate full install manually at http://getdocker.com prequisite #2 and #3. Do not perform if docker is installed. 
- **_[dck.sh](https://github.com/GrayHatGuy/dockery/blob/main/bin/dck.sh)_** - #5 Check apt update/upgrade docker engine and compose versions list network images and containers. 
- **_[dhi.sh](https://github.com/GrayHatGuy/dockery/blob/main/bin/dhi.sh)_** - #6 Default run image hello-worls or user specified verify with ps check.
 
## Sequential scripts
- ☢️ **_[dqd.sh](https://github.com/GrayHatGuy/dockery/blob/main/bin/dqd.sh)_** - #1 to #6  Factory reset. _**god mode**_ executes all scripts in their order listed above {*.sh(i) for i = 1 to n; where n =6}. Ideal for nuking your install of docker and starting with a clean foundation.  
