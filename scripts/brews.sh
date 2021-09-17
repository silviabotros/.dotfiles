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
brew install --cask iterm2
brew install --cask dropbox
brew install --cask github-desktop
brew install --cask spotify
brew install --cask google-chrome
brew install --cask firefox
brew install zsh-syntax-highlighting
brew install gron
brew install gource

brew tap caskroom/cask
brew tap homebrew/cask-versions

# Apps
brew install --cask bartender
brew install --cask dropbox
brew install --cask google-chrome
brew install --cask spotify
brew install --cask alfred
brew install --cask spectacle
brew install --cask rocket


#Finally, cleanup
brew update
brew upgrade
clear
