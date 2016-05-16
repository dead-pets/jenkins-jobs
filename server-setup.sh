#!/bin/bash

# === Part of the default snapshot ===
sudo dpkg-reconfigure tzdata
sudo apt-get dist-upgrade
sudo apt-get install zsh
sudo adduser dpyzhov
sudo usermod -a -G sudo dpyzhov
sudo usermod -a -G adm dpyzhov
# TODO: change password, copy key
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# set ZSH_THEME=mortalscumbag
# === /End of default snapshot ===

wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update

sudo apt-get -y install python-virtualenv python-dev gcc g++ libffi-dev libssl-dev libfreetype6-dev libpng12-dev
sudo apt-get install pkg-config

# TODO: check if device with label jenkins-home exists and mount it
# TODO: connect to launchpad for lp jobs

sudo apt-get -y install jenkins
sudo usermod -a -G shadow jenkins

#
# jenkins slaves
#
apt-get install default-jre-headless

# TODO: copy .local/share/python_keyring/keyringrc.cfg google key and trello credentials


# Docker setup: https://docs.docker.com/engine/installation/linux/ubuntulinux/
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo deb https://apt.dockerproject.org/repo ubuntu-wily main | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r)
sudo apt-get install docker-engine
sudo usermod -aG docker dpyzhov
sudo systemctl enable docker
sudo service docker start
# Relogin in order to get docker group permissions
docker run hello-world

