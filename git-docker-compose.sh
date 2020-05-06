#! /bin/bash

echo "=====Install Git====="
sudo apt-get update

sudo apt-get install git

echo "=====Install Docker====="
sudo apt-get update

sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

sudo apt-get update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker ${USER}

echo "=====Install Docker Compose====="
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

echo "=====Sanity Checks====="
git --version
docker --version
docker-compose --version

su - ${USER}
