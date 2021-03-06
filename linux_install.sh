#!/bin/bash

# yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/gaoljie/system-config/master/linux_install.sh)"

sudo apt update
echo "install zsh"
sudo apt install -y zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

echo "install nodejs"
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs

echo "install n yarn"
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
sudo npm install -g n yarn

#echo "install mysql"
#sudo apt install -y mysql-server
#sudo /etc/init.d/mysql start
#
#echo "install redis"
#sudo apt install -y redis
#sudo service redis-server start

echo "config git and ssh"
if [ -f "~/.ssh/id_rsa.pub" ]; then
    echo "git already set up"
else
	echo "git setup"
    ssh-keygen -t rsa -b 4096 -C "gaoljie@gmail.com" -N "" -f ~/.ssh/id_rsa -q
    # The SSH authentication agent allows you to enter your private key passphrase once and it will save it for the whole login session.
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    curl https://raw.githubusercontent.com/gaoljie/system-config/master/.gitconfig -o ~/.gitconfig
fi

echo "Done!"

cat ~/.ssh/id_rsa.pub

#chsh -s $(which zsh)
#sudo mysql
#ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
#FLUSH PRIVILEGES;
