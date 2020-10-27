#!/bin/bash

# echo y | sh -c "$(wget -O- https://raw.githubusercontent.com/gaoljie/system-config/master/linux_install.sh)"

# install zsh
sudo apt install zsh

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install nodejs
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs

# install n and yarn
# make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
# take ownership of node install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
npm install -g n yarn

# git config
# git configure
if [ -f "~/.ssh/id_rsa.pub" ]; then
    echo "git already set up"
else
	echo "git setup"
    ssh-keygen -t rsa -b 4096 -C "gaoljie@gmail.com"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    curl https://raw.githubusercontent.com/gaoljie/system-config/master/.gitconfig -o ~/.gitconfig
    
fi
