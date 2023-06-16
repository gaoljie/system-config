echo "Configuring OSX..."

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# password can be less than 4 digits
pwpolicy -clearaccountpolicies


echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo "Installing brew packages..."

PACKAGES=(
    n
    redis
    postgresql
    yarn
    mysql
    flux
    microsoft-edge
    iina
    gnupg
    iterm2
    spectacle
    ticktick
    webstorm
    slack
    visual-studio-code
    insomnia
    postman
    notion
    scroll-reverser
)

brew install ${PACKAGES[@]}

# two npm registry
echo "install nvm" 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install 16

echo "Config n package"

# n configure
sudo mkdir /usr/local/n
sudo chown -R $(whoami) /usr/local/n
sudo chown -R $(whoami) /usr/local/lib /usr/local/include /usr/local/share
n stable

# start redis
brew services start redis
brew services start mysql

# download oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# git configure or upload your old ssh (two ssh key)

# install gpg (two gpg key)
cd ~
if [ -f "~/.ssh/id_rsa.pub" ]; then
    echo "git already set up"
else
	echo "git setup"
    ssh-keygen -t rsa -b 4096 -C "gaoljie@gmail.com"
    eval `ssh-agent`
    ssh-add -K ~/.ssh/id_rsa
    pbcopy < ~/.ssh/id_rsa.pub
    cd ~
    sudo curl -O https://raw.githubusercontent.com/gaoljie/system-config/master/.gitconfig
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

# install input method

# switch command and alt for keyboard
