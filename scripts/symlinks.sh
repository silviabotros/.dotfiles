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
ln -s "$SOURCE"/.dotfiles/config/vimrc ~/.vimrc
ln -s "$SOURCE"/.dotfiles/config/zshrc ~/.zshrc
ln -s "$SOURCE"/.dotfiles/config/aliases ~/.aliases
ln -s "$SOURCE"/.dotfiles/config/eddiezane.zsh-theme ~/.oh-my-zsh/custom/themes/eddiezane.zsh-theme
ln -s "$SOURCE"/.dotfiles/config/eddiezane.plugin.zsh ~/.oh-my-zsh/custom/plugins/eddiezane/eddiezane.plugins.zsh
ln -s "$SOURCE"/.dotfiles/config/tmux.conf ~/.tmux.conf
ln -s "$SOURCE"/.dotfiles/config/gemrc ~/.gemrc

ln -s "$SOURCE"/.dotfiles/config/myclirc ~/.myclirc
ln -s "$SOURCE"/.dotfiles/config/ssh-config ~/.ssh/config
