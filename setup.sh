#!/bin/bash
## ~/dockery/setup.sh
echo "Starting " $(basename) 
echo "Updating PATH with ~/dockery/bin/ "
export PATH="~/dockery/bin/:$PATH" >> ~/.bashrc && echo "Changing scripts to executable" && chmod u+x ~/dockery/bin/*.sh
retVal=$?
if [ $retVal -ne 0 ]; then
echo "Error"
else
echo "Setup Completed"
echo "logout to finish update to $PATH"
fi
echo $basename
exit $retVal