#!/bash/bin
## go $HOME
cd ~/
## clone git
## git clone https://github.com/GrayHatGuy/dockery.git
## echo "cloned dockery"
## add $PATH
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/dockery/bin"
  echo "dockery setup pass added to $PATH"
else
  echo "dockery setup failed download git git clone https://github.com/GrayHatGuy/dockery.git and update path to /dockery/bin"
fi

