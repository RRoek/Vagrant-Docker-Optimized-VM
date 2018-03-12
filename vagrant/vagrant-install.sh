#!/bin/bash

Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m' # Cyan


#Installation des plugin nécessaires à la synchronisation des dossiers entre l'hôte et l'invité :
echo -e "$Cyan \n\n Install plugins vagrant-share & vagrant-vbguest :\n\n $Color_Off"
echo -e "vagrant plugin install vagrant-share \n"
vagrant plugin install vagrant-share;
echo -e "vagrant plugin install vagrant-vbguest \n"
vagrant plugin install vagrant-vbguest;
echo -e "vagrant plugin install vagrant-proxyconf \n"
vagrant plugin install vagrant-proxyconf;
echo -e "vagrant plugin install vagrant-winnfsd \n"
vagrant plugin install vagrant-winnfsd;

#Installation de vagrant et redémarrage afin que docker soit pris en compte :
echo -e "$Cyan \n\n Install Vm Box & Docker + Docker Compose \n\n $Color_Off"
echo -e "vagrant up \n"
vagrant up;
echo -e "vagrant ssh -c \"bash < init/install-docker.sh\"   \n"
vagrant ssh -c "bash < init/install-docker.sh"  
echo -e "vagrant halt \n"
vagrant halt;

echo -e "$Cyan \n\n Replay provision for Docker get to work :\n\n $Color_Off"
echo -e "vagrant up \n"
vagrant up;
echo -e "vagrant ssh -c \"bash < init/install-docker.sh\"   \n"
vagrant ssh -c "bash < init/install-docker.sh"  
echo -e "vagrant halt \n"
vagrant halt;

echo -e "$Cyan \n\n Replay provision for Docker get to work :\n\n $Color_Off"
echo -e "vagrant up \n"
vagrant up;
echo -e "vagrant ssh -c \"bash < init/install-docker.sh\"   \n"
vagrant ssh -c "bash < init/install-docker.sh"
echo -e "vagrant ssh -c \"bash < init/mkdir-to-composer.sh\"   \n"
vagrant ssh -c "bash < init/mkdir-to-composer.sh"
echo -e "vagrant halt \n"
vagrant halt;


echo -e "$Green \n\n Congratulation ! Your VM Vagrant-Docker is ready, you can start it with 'vagrant up' command and connect to it with 'vagrant ssh' command \n\n $Color_Off"
echo -e "$Yellow \n\n Note : Always shutdown your VM if you don't want to break it ! To do this : 'vagrant halt' \n\n $Color_Off"