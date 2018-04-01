#!/bin/sh
SOURCE=$(pwd)

rm ~/.vimrc
rm ~/.zshrc
rm ~/.tmux.conf
rm ~/.oh-my-zsh/custom/theme/eddiezane.zsh-theme
rm ~/.oh-my-zsh/custom/plugins/eddiezane/eddiezane.plugins.zsh
rm ~/.gemrc
rm ~/.myclirc
rm ~/.ssh/config
ln -s "$SOURCE"/config/vimrc ~/.vimrc
ln -s "$SOURCE"/config/zshrc ~/.zshrc
ln -s "$SOURCE"/config/aliases ~/.aliases
ln -s "$SOURCE"/config/eddiezane.zsh-theme ~/.oh-my-zsh/custom/themes/eddiezane.zsh-theme
ln -s "$SOURCE"/config/eddiezane.plugin.zsh ~/.oh-my-zsh/custom/plugins/eddiezane/eddiezane.plugins.zsh
ln -s "$SOURCE"/config/tmux.conf ~/.tmux.conf
ln -s "$SOURCE"/config/gemrc ~/.gemrc

ln -s "$SOURCE"/config/myclirc ~/.myclirc
ln -s "$SOURCE"/config/ssh-config ~/.ssh/config
