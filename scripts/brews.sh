#!/bin/sh

# use ssh instead of HTTPS for sendgrid repo cloning
git config --global url.ssh://git@github.com/sendgrid.insteadOf https://github.com/sendgrid

brew install tree
brew install csshx
brew install neovim/neovim/neovim
brew reinstall --HEAD neovim
brew install thefuck
brew install myrepos
brew install mycli
brew install jq
brew install aws-shell
brew install pyenv
brew install terraform
brew install mas
brew cask install iterm2
brew cask install dropbox
brew cask install github-desktop
brew cask install spotify
brew cask install google-chrome
brew cask install firefox

# Tap the sendgrid cask
brew tap --full sendgrid-ops/workstation

brew install aws-okta
brew install zsh-syntax-highlighting

#Finally, cleanup
brew update
brew upgrade
clear
