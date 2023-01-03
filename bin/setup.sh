#!/bin/bash
## ~/dockery/setup.sh
echo "Starting "   
echo "Updating script to executable set PATH with ~/dockery/bin/ adding aliases to .bashrc"
sudo chmod u+x ~/dockery/bin/*.sh
export PATH="~/dockery/bin/:$PATH" >> ~/.bashrc 
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error"
else
echo "Setup Completed"
echo "logout to finish update to $PATH"
fi
echo $basename
exit $retVal