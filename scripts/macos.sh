#!/bin/sh

# Close any open System Settings panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Settings" to quit'
# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

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
# 10: Put display to sleep
# 12: Notification Center
# 13: Lock Screen
# Top right screen corner → Notification Center
defaults write com.apple.dock wvous-tr-corner -int 12
# Bottom right screen corner → Desktop
defaults write com.apple.dock wvous-br-corner -int 4
# Top left screen corner → Application windows
defaults write com.apple.dock wvous-tl-corner -int 3
# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Show the ~/Library folder
chflags nohidden ~/Library

# Automatically install system data files and security updates
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"


# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Restart Finder for changes to take affect...
killall "Finder" &> /dev/null
#finally, kill the dock
killall "Dock" &> /dev/null
