#!/bin/sh
brew install mas
# Fantastical 2
mas install 975937182
# Keynote
mas install 409183694
# Slack
#mas install 803453959
# Pages
mas install 409201541
# Numbers
mas install 361304891
# GarageBand
mas install 682658836
# iMovie
mas install 408981434
# Things
mas install 904280696
#1Blocker
mas install 1365531024
# Dark Reader for Safari
mas install 1438243180
# 1Password for Safari
mas install 1569813296
# Xcode
mas install 497799835
# Install the apm packages
# On first run, this will take you to the browser to get a token
apm stars --install
apm rebuild
