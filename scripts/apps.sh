#!/bin/sh
brew install mas
# Fantastical 2
mas install 975937182
# Keynote
mas install 409183694
# Kindle
mas install 405399194
# Slack
#mas install 803453959
# Pages
mas install 409201541
# Things 
mas install 904280696
# EasyRes
mas install 688211836
#1Blocker
mas install 1365531024

# Install the apm packages
# On first run, this will take you to the browser to get a token
apm stars --install
apm rebuild
