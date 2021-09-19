#!/bin/sh

installMenu() {
  echo "Super Awesome Install Menu"
  echo "\t a. Install Mac App Store apps"
  echo "\t d. Set apple defaults"
  echo "\t b. Install my brew formulas"
  echo "\t 0. Install Brew"
  echo "\t 1. Git"
  echo "\t 2. Vim"
  echo "\t 3. Zsh"
  echo "\t 4. Tmux"
  echo "\t 5. Symlink All"
  echo "\t 6. MySQL and MyCLI"
  echo "\t 9. Do (allthethings)"
  echo "\t q. Quit"
}

SOURCE=$(pwd)

installBrew() {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

installGit() {
  brew install git
}

installVim() {
  brew install neovim/neovim/neovim
  brew reinstall --HEAD neovim
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  rm ~/.vimrc
  ln -s ~/.dotfiles/config/vimrc ~/.vimrc
  mkdir ~/.config/nvim
  ln -s ~/.dotfiles/config/init.vim ~/.config/nvim/init.vim
  vim +PluginInstall +qall
}

installZsh() {
  ./scripts/zsh.sh
}

installTmux() {
  brew install tmux
  rm ~/.tmux.conf
  ln -s ~/.dotfiles/config/tmux.conf ~/.tmux.conf
}


symlinkAll() {
  ./scripts/symlinks.sh
}

installBrews() {
  ./scripts/brews.sh
}

setDefaults() {
  ./scripts/macos.sh
}

installApps(){
  ./scripts/apps.sh 
}

installMySQL() {
  brew install mysql
  brew install mycli
}

installAll() {
  installBrew
  installBrews
  installApps
  setDefaults
  installGit
  installVim
  installZsh
  installTmux
  symlinkAll
  installMySQL
}

installMenu

while true
do
  read input
  case $input in
    a) installApps;;
    b) installBrews;;
    d) setDefaults;;
    0) installBrew;;
    1) installGit;;
    2) installVim;;
    3) installZsh;;
    4) installTmux;;
    5) symlinkAll;;
    6) installMySQL;;
    9) installAll;;
    q) break;;
  esac
  installMenu
done
