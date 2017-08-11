#! /bin/bash

sudo apt-add-repository ppa:fish-shell/release-2
sudo apt update
sudo apt install -y tmux vim git golang-go


touch ~/.profiles
echo "export GOROOT=/usr/share/go" >> ~/.profiles
echo "export GOPATH=~/_c/go" >> ~/.profiles
echo "export PATH=$PATH:$GOROOT/bin" >> ~/.profiles

#sudo apt install -y fish
#chsh -s /usr/bin/fish
