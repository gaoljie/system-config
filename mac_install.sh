echo "Start installing"

echo "Configuring OSX..."

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable "natural" scroll
#defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false


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

PACKAGES=(
    git
    n
    redis
    yarn
)

echo "Installing packages..."
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
    shadowsocksx-ng
    slack
    webstorm
    wechat
    zoomus
)

brew cask install ${CASKS[@]}

brew cleanup


echo "Configuring..."

# n configure
sudo chown -R $(whoami) /usr/local/n
n stable

# start redis
brew services start redis

# download oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# git configure
cd ~
if [ -f ".ssh/id_rsa.pub" ]; then
    echo "git already set up"
else
	echo "git setup"
    ssh-keygen -t rsa -b 4096 -C "gaoljie@foxmail.com"
    eval `ssh-agent`
    ssh-add -K ~/.ssh/id_rsa
    pbcopy < ~/.ssh/id_rsa.pub
    curl -O https://raw.githubusercontent.com/gaoljie/system-config/master/.gitconfig ~/.gitconfig
fi

# klook configure
echo "KLook install"
n 8.11.3
yarn global add gulp
brew install pkg-config cairo libpng jpeg giflib pango libjpeg

profile=~/.zshrc

if grep -q "alias gbgd" "$profile"; then
    echo "already added gbgd"
else
    echo "alias gbgd='gulp build & gulp dev'" >> ~/.zshrc
fi

echo "Done!"
