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
  vim +PluginInstall +qall
}

installZsh() {
  brew install zsh
  sudo chsh $USER -s /bin/zsh
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  mkdir ~/.oh-my-zsh/custom/themes
  mkdir ~/.oh-my-zsh/custom/plugins
  rm ~/.zshrc
  ln -s ~/.dotfiles/config/zshrc ~/.zshrc

  # Make zsh the default
  chsh -s /usr/local/bin/zsh
}

installTmux() {
  brew install tmux
  rm ~/.tmux.conf
  ln -s ~/.dotfiles/config/tmux.conf ~/.tmux.conf
}


symlinkAll() {
  rm ~/.vimrc
  rm ~/.zshrc
  rm ~/.tmux.conf
  rm ~/.oh-my-zsh/custom/theme/eddiezane.zsh-theme
  rm ~/.oh-my-zsh/custom/plugins/eddiezane/eddiezane.plugins.zsh
  rm ~/.gemrc
  rm ~/.myclirc
  rm ~/.ssh/config
  ln -s ~/.dotfiles/config/vimrc ~/.vimrc
  ln -s ~/.dotfiles/config/zshrc ~/.zshrc
  ln -s ~/.dotfiles/config/eddiezane.zsh-theme ~/.oh-my-zsh/custom/themes/eddiezane.zsh-theme
  ln -s ~/.dotfiles/config/eddiezane.plugin.zsh ~/.oh-my-zsh/custom/plugins/eddiezane/eddiezane.plugins.zsh
  ln -s ~/.dotfiles/config/tmux.conf ~/.tmux.conf
  ln -s ~/.dotfiles/config/gemrc ~/.gemrc

  ln -s ~/.dotfiles/config/myclirc ~/.myclirc
  ln -s ~/.dotfiles/config/ssh-config ~/.ssh/config
}

installBrews() {
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

  brew install zsh-syntax-highlighting

  #Finally, cleanup
  brew update
  brew upgrade
  clear
}

setDefaults() {
  # Thanks to John Martin for letting me steal some tips and tricks
  # Set dock size
  defaults write com.apple.dock tilesize -int 29
  # Minimize windows into their application’s icon
  defaults write com.apple.dock minimize-to-application -bool true
  # Show indicator lights for open applications in the Dock
  defaults write com.apple.dock show-process-indicators -bool true
  # Don’t group windows by application in Mission Control
  # (i.e. use the old Exposé behavior instead)
  defaults write com.apple.dock expose-group-by-app -bool false
  # Disable Dashboar
  defaults write com.apple.dashboard mcx-disabled -bool true
  # Don’t show Dashboard as a Space
  defaults write com.apple.dock dashboard-in-overlay -bool true
  # Move the dock to the right
  defaults write com.apple.dock orientation -string right
  # Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Disable screen saver
  defaults write com.apple.dock wvous-tr-corner -int 12
  defaults write com.apple.dock wvous-br-corner -int 4
  defaults write com.apple.dock wvous-tl-corner -int 3
  # Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
  defaults write com.apple.finder QuitMenuItem -bool true
  # Avoid creating .DS_Store files on network or USB volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
  # Show the ~/Library folder
  chflags nohidden ~/Library

  # Automatically download apps purchased on other Macs
  defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

  # Disable hibernation (speeds up entering sleep mode)
  sudo pmset -a hibernatemode 0

  # Increase sound quality for Bluetooth headphones/headsets
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 80
  defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 80
  defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" 80
  defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 80
  defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 80
  defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 80
  # Save screenshots to the desktop
  defaults write com.apple.screencapture location -string "${HOME}/Desktop"

  # Enable Safari’s debug menu
  defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

  # Enable the Develop menu and the Web Inspector in Safari
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

  # Warn about fraudulent websites
  defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

  # Update extensions automatically
  defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

  # Disable the “Are you sure you want to open this application?” dialog
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  # Increase sound quality for Bluetooth headphones/headsets
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

  # Show the full URL in the address bar (note: this still hides the scheme)
  defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

  # Don’t display the annoying prompt when quitting iTerm
  defaults write com.googlecode.iterm2 PromptOnQuit -bool false

  killall "Safari" &> /dev/null
  # Restart Finder for changes to take affect...
  killall "Finder" &> /dev/null
  #finally, kill the dock
  killall "Dock" &> /dev/null
}

installApps(){
  brew install mas
  # Airmail 3
  mas install 918858936
  # Fantastical 2
  mas install 975937182
  # Keynote
  mas install 409183694
  # Kindle
  mas install 405399194
  # Slack
  mas install 803453959
  # Pages
  mas install 409201541
  # Tweetbot
  mas 557168941
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
