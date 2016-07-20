set fisher_config ~/.config/fisherman

set -U fish_user_paths /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin $HOME/.dotfiles/bin

eval $HOME/.base16_theme

source ~/.exports
source ~/.aliases

alias vim nvim

setenv DISABLE_AUTO_TITLE true
setenv SWIFTENV_ROOT "$HOME/.swiftenv"
status --is-interactive; and . (swiftenv init -|psub)
