#!/bin/sh
brew install zsh
sudo chsh $USER -s /bin/zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mkdir ~/.oh-my-zsh/custom/themes
mkdir ~/.oh-my-zsh/custom/plugins
rm ~/.zshrc
ln -s ~/.dotfiles/config/zshrc ~/.zshrc

# Make zsh the default
chsh -s /usr/local/bin/zsh
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
