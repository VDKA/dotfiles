set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

set -U fish_user_paths /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin $HOME/.dotfiles/bin

eval $HOME/.base16_theme

setenv DISABLE_AUTO_TITLE true
setenv SWIFTENV_ROOT "$HOME/.swiftenv"
setenv PATH "$SWIFTENV_ROOT/bin" $PATH
status --is-interactive; and . (swiftenv init -|psub)

