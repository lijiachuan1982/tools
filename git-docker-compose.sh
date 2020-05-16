#! /bin/bash

echo "##########################################################"
echo "####################### Install Git ######################"
echo "##########################################################"

sudo apt-get update

sudo apt-get install git

echo "##########################################################"
echo "###################### Install Docker ####################"
echo "##########################################################"

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

echo "##########################################################"
echo "################## Install Docker Compose ################"
echo "##########################################################"

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

echo "##########################################################"
echo "###################### Sanity Checks #####################"
echo "##########################################################"

git --version
docker --version
docker-compose --version

echo "##########################################################"
echo "########### Type Your Password To Complete ###############"
echo "##########################################################"
su - ${USER}
