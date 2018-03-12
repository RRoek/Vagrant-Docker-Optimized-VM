#!/bin/bash

Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m' # Cyan

#Install Docker on Vagrant/VirtualBox VM

#Install Docker engine
echo -e "$Cyan \n sudo apt-get -y update :\n $Color_Off"
sudo apt-get -y update
echo -e "$Cyan \n sudo apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual apt-transport-https ca-certificates :\n $Color_Off"
sudo apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual apt-transport-https ca-certificates
echo -e "$Cyan \n sudo apt-key adv \ --keyserver hkp://ha.pool.sks-keyservers.net:80 \ --recv-keys 58118E89F3A912897C070ADBF76221572C52609D :\n $Color_Off"
sudo apt-key adv \
             --keyserver hkp://ha.pool.sks-keyservers.net:80 \
             --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo -e "$Cyan \n echo \"deb https://apt.dockerproject.org/repo ubuntu-$(lsb_release --codename | cut -f2) main\" | sudo tee /etc/apt/sources.list.d/docker.list :\n $Color_Off"			 
echo "deb https://apt.dockerproject.org/repo ubuntu-$(lsb_release --codename | cut -f2) main" | sudo tee /etc/apt/sources.list.d/docker.list
echo -e "$Cyan \n sudo apt-get -y update :\n $Color_Off"
sudo apt-get -y update
echo -e "$Cyan \n sudo apt-get install docker-engine :\n $Color_Off"
sudo apt-get install docker-engine

#Docker as $USER
echo -e "$Cyan \n sudo groupadd docker :\n $Color_Off"
sudo groupadd docker             # optional
echo -e "$Cyan \n sudo gpasswd -a ${USER} docker :\n $Color_Off"
sudo gpasswd -a ${USER} docker

#Start docker engine
echo -e "$Cyan \n sudo service docker start :\n $Color_Off"
sudo service docker start
echo -e "$Cyan \n docker run hello-world :\n $Color_Off"
docker run hello-world

#Docker Compose
echo -e "$Cyan \n sudo curl -L \"https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose :\n $Color_Off"
sudo curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo -e "$Cyan \n sudo chmod +x /usr/local/bin/docker-compose :\n $Color_Off"
sudo chmod +x /usr/local/bin/docker-compose