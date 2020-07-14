#!/usr/bin/env bash

echo "********************************************************"
echo "* [1]: MISE A JOUR DE LA LISTE DES PAQUETS DISPONIBLES *"
echo "********************************************************"
apt-get update

echo "****************************"
echo "* [2]: INSTALLATION DE VIM *"
echo "****************************"
apt-get install -y vim

echo "********************************"
echo "* [3]: INSTALLATION DE ANSIBLE *"
echo "********************************"
apt-get install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install -y ansible

echo "*************************************************"
echo "* [4]: INSTALLATION DE DOCKER ET DOCKER-COMPOSE *"
echo "*************************************************"
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
usermod -aG docker vagrant
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#echo "*****************************************************************************"
#echo "* [5]: LANCEMENT DES CONTAINEURS DEBIAN AVEC SSHD ET NGINX, BUILD SI BESOIN *"
#echo "*****************************************************************************"
#docker-compose --project-directory /vagrant/ --file /vagrant/docker-compose.yml up -d

