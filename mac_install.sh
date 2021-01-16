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
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing brew packages..."

PACKAGES=(
    n
    redis
    yarn
    awscli
    mysql
    alfred
    flux
    microsoft-edge
    iina
    iterm2
    spectacle
    sequel-pro
    ticktick
    typora
    webstorm
    webtorrent
    slack
    visual-studio-code
    insomnia
    notion
)

brew install ${PACKAGES[@]}

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
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# git configure
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

#alias yi='yarn install'
#alias yd='yarn dev'
#alias yb='yarn build'
#alias ys='yarn start'