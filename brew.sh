#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
	if [ "$(uname)" == "Darwin" ]; then
		#On a mac
		echo "Installing HomeBrew"
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		#On a linux
		echo "Installing LinuxBrew deps"
		#Makes assumpion of debian or ubuntu distro. Will fail on Fedora, centOS, RedHat
		sudo apt-get install build-essential curl git m4 python-setuptools ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev

		echo "Installing LinuxBrew"
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
#brew install coreutils
#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
#brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
#brew install findutils

# Install fish shell
brew install fish

echo "Brewing some things"
# Install `wget` with IRI support.
brew install wget

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install ack
brew install ag
brew install openssh
brew install tmux

# Install other useful binaries.
brew install ack
brew install dark-mode
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install speedtest_cli
brew install ssh-copy-id
brew install markdown
brew install vifm
brew install z

if [ "$(uname)" == "Darwin" ]; then
	echo "Installing Homebrew Casks"
	# Install Cask
	brew install caskroom/cask/brew-cask

	# Core casks
	brew cask install --appdir="~/Applications" iterm2

	# Development tool casks
	brew cask install --appdir="/Applications" sublime-text3
	brew cask install --appdir="/Applications" atom
	brew cask install --appdir="/Applications" virtualbox
	brew cask install --appdir="/Applications" macdown

	# Misc casks
	brew cask install --appdir="/Applications" google-chrome
	brew cask install --appdir="/Applications" firefox
	brew cask install --appdir="/Applications" slack
	brew cask install --appdir="/Applications" dropbox
	#brew cask install --appdir="/Applications" skype

	# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
	brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
fi


echo "Installing docker"
# Install Docker, which requires virtualbox
brew install docker
brew install boot2docker

echo "Cleaning Up"
# Remove outdated versions from the cellar.
brew cleanup
echo

