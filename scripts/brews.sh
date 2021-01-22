#!/bin/sh

# use ssh instead of HTTPS for sendgrid repo cloning
git config --global url.ssh://git@github.com/sendgrid.insteadOf https://github.com/sendgrid

#Taps
brew tap 'caskroom/cask'

brew install tree
brew install free
brew install neovim/neovim/neovim
brew reinstall --HEAD neovim
brew install thefuck
brew install myrepos
brew install mycli
brew install jq
brew install aws-shell
brew install pyenv
brew install mas
brew cask install iterm2
brew cask install dropbox
brew cask install github-desktop
brew cask install spotify
brew cask install google-chrome
brew cask install firefox
brew install zsh-syntax-highlighting
brew install gron
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


#Finally, cleanup
brew update
brew upgrade
clear
