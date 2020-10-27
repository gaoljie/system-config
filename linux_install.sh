#!/bin/bash

# echo y | sh -c "$(wget -O- https://raw.githubusercontent.com/gaoljie/system-config/master/linux_install.sh)"

echo "install zsh"
sudo apt install zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "install nodejs"
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "install n yarn"
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
npm install -g n yarn

echo "config git and ssh"
if [ -f "~/.ssh/id_rsa.pub" ]; then
    echo "git already set up"
else
	echo "git setup"
    ssh-keygen -t rsa -b 4096 -C "gaoljie@gmail.com"
    # The SSH authentication agent allows you to enter your private key passphrase once and it will save it for the whole login session.
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    curl https://raw.githubusercontent.com/gaoljie/system-config/master/.gitconfig -o ~/.gitconfig
fi

echo "config zsh alias"
profile=~/.zshrc

if grep -q "alias yd" "$profile"; then
    echo "already added zsh alia"
else
    echo "alias yi='yarn install'" >> ~/.zshrc
    echo "alias yd='yarn dev'" >> ~/.zshrc
    echo "alias yb='yarn build'" >> ~/.zshrc
    echo "alias ys='yarn start'" >> ~/.zshrc
fi

echo "Done!"