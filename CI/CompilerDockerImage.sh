sudo docker run -it ubuntu:16.04 /bin/bash

apt install -y ubuntu-desktop
apt install -y vim curl wget
#apt install -y golang-1.8-go
wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
sudo tar -zxvf go1.8.linux-amd64.tar.gz -C /usr/local/


apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt install -y docker-ce

#apt install -y git 

sudo docker cp . bda2a754d564:/root/_c/go/src/github.com/prebid/prebid-server

curl https://glide.sh/get | sh

mkdir -p ~/_c/go/src/github.com/prebid/prebid-server
mkdir -p ~/_c/go/pkg
mkdir -p ~/_c/go/bin


glide install
go fmt ./...
sudo docker run --rm -v "$PWD":/go/src/github.com/prebid/prebid-server -w /go/src/github.com/prebid/prebid-server grissonz/gobuilder make build

sudo docker run --rm -v "$PWD":/go/src/github.com/prebid/prebid-server -w /go/src/github.com/prebid/prebid-server grissonz/gobuilder:0.2 make build


sudo docker ps -aq --no-trunc | xargs sudo docker rm
sudo docker images -q --filter dangling=true | xargs sudo docker rmi

env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build .


// Option 1: Mac: build on mac and run on alpine
env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build .
sudo docker build -t prebid-bingads .

// Option 2: Mac: build on alpine and run on alpine
sudo docker run -it -v "$PWD":/go/src/github.com/prebid/prebid-server -w /go/src/github.com/prebid/prebid-server grissonz/gobuilder make build
sudo docker build -t prebid-bingads .

// option 3: Windows: build on apline and run on apline


////// untested
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o [name of binary]