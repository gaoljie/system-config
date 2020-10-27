#!/bin/bash

# echo y | sh -c "$(wget -O- https://raw.githubusercontent.com/gaoljie/system-config/master/linux_install.sh)"

# install zsh
sudo apt install zsh

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install nodejs
# curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
# sudo apt-get install -y nodejs

# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# sudo apt update && sudo apt install yarn

# make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
# take ownership of node install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
bash n lts
rm n
