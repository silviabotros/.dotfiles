#!/bin/sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir -p ~/.oh-my-zsh/custom/themes
mkdir -p ~/.oh-my-zsh/custom/plugins
rm ~/.zshrc
ln -s ~/.dotfiles/config/zshrc ~/.zshrc
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
