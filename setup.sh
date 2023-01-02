#!/bash/bin
## go $HOME
cd ~/
## clone git
git clone https://github.com/GrayHatGuy/dockery.git
echo "cloned dockery"
## add $PATH
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/dockery/bin"
  echo "dockery added to $PATH"
else
  echo "dockery install failed download git git clone https://github.com/GrayHatGuy/dockery.git and update path to /dockery/bin"
fi

