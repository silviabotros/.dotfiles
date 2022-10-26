#!/bin/sh
/opt/homebrew/bin/brew install zsh
sudo chsh $USER -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir ~/.oh-my-zsh/custom/themes
mkdir ~/.oh-my-zsh/custom/plugins
rm ~/.zshrc
ln -s ~/.dotfiles/config/zshrc ~/.zshrc

# Make zsh the default
chsh -s /usr/local/bin/zsh
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
