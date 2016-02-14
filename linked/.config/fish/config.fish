set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

set -U fish_user_paths /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin $HOME/.rbenv/bin $HOME/.dotfiles/bin

eval $HOME/.base16_theme

