#!/bin/bash

wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update

sudo apt-get -y install python-virtualenv python-dev gcc g++ libffi-dev libssl-dev libfreetype6-dev libpng12-dev
sudo apt-get install pkg-config

# TODO: check if device with label jenkins-home exists and mount it
# TODO: connect to launchpad for lp jobs

sudo apt-get -y install jenkins
sudo usermod -a -G shadow jenkins

sudo adduser dpyzhov
sudo usermod -a -G sudo dpyzhov
sudo usermod -a -G adm dpyzhov
# TODO: change password, copy key

# TODO: configure timezone
sudo dpkg-reconfigure tzdata


#
# jenkins slaves
#
apt-get install default-jre-headless

# TODO: copy .local/share/python_keyring/keyringrc.cfg google key and trello credentials


sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# ZSH_THEME=mortalscumbag
