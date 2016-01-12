#!/bin/bash

confirm () {
	# call with a prompt string or use a default
	read -r -p "${1:-Are you sure? [y/N]} " response
	case $response in 
		[yY][eE][sS]|[yY]) true ;;
		*) false ;;
	esac
}

echo "Installing dotfiles"
echo

echo "Initializing submodule(s)"
git submodule update --init --recursive
echo

pushd $(dirname $0) > /dev/null
SCRIPTPATH=$(pwd)
popd > /dev/null

if confirm "Would you like to symlink dotfiles?"; then
	echo "Linking dotfiles"
	source $SCRIPTPATH/link.sh
	echo
fi

if confirm "Would you like to use brew to install utilities and application (osx)?"; then
	echo "Installation of developer utilities"
	source $SCRIPTPATH/brew.sh
fi

if confirm "Would you like to install fish shell framework omf?"; then
	echo "Install Oh My Fish"
	curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
fi

if [ "$(uname)" == "Darwin" ]; then
	if confirm "Would you like to perform update osx settings?"; then
		echo "Running on OSX"
		echo "Preparing OSX for use (there may be prompts)"
		source $SCRIPTPATH/osxprep.sh
		echo

		echo "Updating OSX settings"
		source $SCRIPTPATH/osx.sh
		echo
	fi

else 		#Setup things homebrew would usually do when not on a mac.
	echo "Running on *NIX"

fi

if confirm "Would you like to set fish shell as default shell?"; then
	echo "Configuring fish as default shell"
	sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
	chsh -s $(which fish)
fi

echo "Done."
