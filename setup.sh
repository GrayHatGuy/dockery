#!/bash/bin

cd ~/

Clone the repo.

git clone https://github.com/GrayHatGuy/dockery.git

Add scripts to PATH

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/dockery/bin"
fi
