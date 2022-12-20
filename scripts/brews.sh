#!/bin/sh


#Taps
/opt/homebrew/bin/brew tap 'caskroom/cask'

/opt/homebrew/bin/brew install tree
/opt/homebrew/bin/brew install free
/opt/homebrew/bin/brew install neovim/neovim/neovim
/opt/homebrew/bin/brew reinstall --HEAD neovim
/opt/homebrew/bin/brew install thefuck
/opt/homebrew/bin/brew install myrepos
/opt/homebrew/bin/brew install mycli
/opt/homebrew/bin/brew install jq
/opt/homebrew/bin/brew install pyenv
/opt/homebrew/bin/brew install mas
/opt/homebrew/bin/brew install zsh-syntax-highlighting
/opt/homebrew/bin/brew install gron
/opt/homebrew/bin/brew install gource
/opt/homebrew/bin/brew install dog
/opt/homebrew/bin/brew tap caskroom/cask
/opt/homebrew/bin/brew tap homebrew/cask-versions

# Apps
/opt/homebrew/bin/brew install --cask bartender
/opt/homebrew/bin/brew install --cask google-chrome
/opt/homebrew/bin/brew install --cask alfred
/opt/homebrew/bin/brew install --cask rectangle
/opt/homebrew/bin/brew install --cask rocket
/opt/homebrew/bin/brew install --cask iterm2
/opt/homebrew/bin/brew install --cask firefox
/opt/homebrew/bin/brew install karabiner-elements
/opt/homebrew/bin/brew install dropshare


#Finally, cleanup
/opt/homebrew/bin/brew update
/opt/homebrew/bin/brew upgrade
clear
