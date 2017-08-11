#! /bin/bash

sudo apt-add-repository ppa:fish-shell/release-2
sudo apt update
sudo apt install -y tmux \
    vim \
    git \
    golang-go \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    tree

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
sudo apt update

sudo apt install -y docker-ce

#touch ~/.profiles

#mkdir -p ~/_c/go/bin
#mkdir -p ~/_c/go/src
#mkdir -p ~/_c/go/pkg

#echo "export GOROOT=/usr/share/go" >> ~/.profiles
#echo "export GOPATH=~/_c/go" >> ~/.profiles
#echo "export PATH=$PATH:$GOROOT/bin" >> ~/.profiles

#sudo apt install -y fish
#chsh -s /usr/bin/fish
