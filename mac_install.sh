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
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap homebrew/cask-drivers
fi


echo "Updating homebrew..."
brew update


echo "Installing brew packages..."

PACKAGES=(
    git
    n
    redis
    yarn
    zsh
    aws
    youtube-dl
)

brew install ${PACKAGES[@]}


echo "Cleaning up..."
brew cleanup

echo "Installing cask apps..."
CASKS=(
    alfred
    flux
    google-chrome
    iina
    neteasemusic
    postman
    iterm2
    spectacle
    mos
    sequel-pro
    ticktick
    typora
    webstorm
    webtorrent
    shadowsocksx-ng
    slack
    visual-studio-code
    wechat
    insomnia
)

brew cask install ${CASKS[@]}

brew cleanup

echo "Config n package"

# n configure
sudo mkdir /usr/local/n
sudo chown -R $(whoami) /usr/local/n
sudo chown -R $(whoami) /usr/local/lib /usr/local/include /usr/local/share
n stable

# yarn global package
yarn global add @vue/cli
yarn global add serve
yarn global add create-react-app


# start redis
# brew services start redis

# download oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


curl -o ~/.zshrc https://raw.githubusercontent.com/gaoljie/system-config/master/.zshrc

#  install powefont
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh

# install hightlight
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions



# git configure
cd ~
if [ -f ".ssh/id_rsa.pub" ]; then
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



profile=~/.zshrc

if grep -q "alias gbgd" "$profile"; then
    echo "already added gbgd"
else
    echo "alias gbgd='gulp build & gulp dev'" >> ~/.zshrc
fi

echo "Done!"