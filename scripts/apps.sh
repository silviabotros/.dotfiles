#!/bin/sh
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

# Install the apm packages
# On first run, this will take you to the browser to get a token
apm stars --install
apm rebuild
