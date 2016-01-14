# Aliases

alias cmatrix="cmatrix -s"
alias xc="open -a Xcode.app"
alias uni="cd $HOME/Dropbox/University"
alias ddclean="rm -rf ~/Library/Developer/Xcode/DerivedData/*"
alias :q="exit"
alias swiftc="xcrun -sdk macosx swiftc"
alias dockerswift="docker-osx-dev > /dev/null & docker run -it -v (pwd):/root/code swift:latest; fg"
alias git=hub


# Work

set -g CRYPTO_FIELD_KEY anything

# Paths

set PATH /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin $PATH
set -U fish_user_paths $HOME/scripts /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin $HOME/.rbenv/bin $DOTFILES/bin

eval sh $HOME/.base16-theme
