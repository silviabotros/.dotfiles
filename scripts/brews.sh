#!/bin/sh

# use ssh instead of HTTPS for sendgrid repo cloning
git config --global url.ssh://git@github.com/sendgrid.insteadOf https://github.com/sendgrid

#Taps
brew tap 'caskroom/cask'

brew install tree
brew install free
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
brew install packer
brew cask install iterm2
brew cask install dropbox
brew cask install github-desktop
brew cask install spotify
brew cask install google-chrome
brew cask install firefox
brew install brandt/personal/openconnect-keychain
brew install zsh-syntax-highlighting
brew install gron
brew install hub
brew install gource

brew tap caskroom/cask
brew tap homebrew/cask-versions

# Apps
brew cask install bartender
brew cask install dropbox
brew cask install google-chrome
brew cask install spotify
brew cask install alfred
brew cask install spectacle
brew cask install rocket

brew cask install atom

#Finally, cleanup
brew update
brew upgrade
clear
