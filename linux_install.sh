#!/bin/bash

# echo y | sudo sh -c "$(wget -O- https://raw.githubusercontent.com/gaoljie/system-config/master/linux_install.sh)"

# install zsh
apt install zsh

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"