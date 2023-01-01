#!/bash/bin
## go $HOME
cd ~/
## clone git
git clone https://github.com/GrayHatGuy/dockery.git
echo "cloned dockery"
## add $PATH
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/dockery/bin"
fi
echo "added to $PATH"
