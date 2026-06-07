#!/bin/sh
SOURCE=$(pwd)

rm -f ~/.vimrc
rm -f ~/.zshrc
rm -f ~/.tmux.conf
rm -f ~/.gemrc
rm -f ~/.myclirc
rm -f ~/.ssh/config
rm -f ~/.gitconfig
rm -f ~/.claude/CLAUDE.md
ln -s "$SOURCE"/config/vimrc ~/.vimrc
ln -s "$SOURCE"/config/zshrc ~/.zshrc
ln -s "$SOURCE"/config/aliases ~/.aliases
ln -s "$SOURCE"/config/tmux.conf ~/.tmux.conf
ln -s "$SOURCE"/config/gemrc ~/.gemrc
ln -s "$SOURCE"/config/myclirc ~/.myclirc
ln -s "$SOURCE"/config/ssh-config ~/.ssh/config
ln -s "$SOURCE"/config/gitconfig ~/.gitconfig
ln -s "$SOURCE"/config/claude-settings.json ~/.claude/settings.json
ln -s "$SOURCE"/config/CLAUDE.md ~/.claude/CLAUDE.md
