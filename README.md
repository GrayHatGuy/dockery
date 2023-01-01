# dockery

## bash scripts for improving docker workflow efficiency

### Description

The following scripts automate routine tasks associated with docker composition and container devlepment. Basically they are transcribed from a docker cheat sheet I have been compiling. The intent is for this to be a shared document by the community so feel free to add any others to the list. 

Scripts that _**REMOVE DATA**_ are: dcl.sh drm.sh and dqd.sh. Images and routes will be backed up _**BUT**_ volume information will _**NOT**_.  To manually backup any critical volume data use the commands:
 
	docker run -v /dbdata --name dbstore ubuntu /bin/bash
	docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf ~/backup_volume.tar /dbdata
    
_The above opens a container volume /dbdata on dbstore for backup to localhost ~/ Update with the input container you are backing up and the output tar location._

## Scripts included and descriptions

dbu.sh - #1 Backup all images and ifconfig routes to ~/dockbkup/

dcl.sh - #2 Cleans docker removes containers images then prunes network and volumes. **_WARNING: Data will be removed in this process!_**

drm.sh - #3 Removes **ALL** things docker including installatio.n **_WARNING: Data will be removed in this process!_**

ddn.sh - #4 Quick install script for docker.

dck.sh - #5 Check docker engine and compose versions then apt update/upgrade run hello-world test then output a process list.

dqd.sh - _**god mode**_ executes all scripts in order listed above. **_WARNING: Data will be removed in this process!_**
