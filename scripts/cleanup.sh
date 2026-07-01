#!/bin/sh
# ABOUTME: Removes leftovers from configs and packages this repo no longer manages.
# ABOUTME: Deletes dead symlinks into .dotfiles, uninstalls dropped brew packages and taps.

BREW=/opt/homebrew/bin/brew

# Remove symlinks in $HOME that point into .dotfiles but whose target no
# longer exists (e.g. ~/.gemrc after the gemrc config was deleted)
find "$HOME" -maxdepth 1 -type l | while read -r link; do
  case "$(readlink "$link")" in
    *.dotfiles/*)
      if [ ! -e "$link" ]; then
        echo "Removing dead symlink: $link"
        rm "$link"
      fi
      ;;
  esac
done

# Uninstall packages that were dropped from brews.sh
for formula in thefuck; do
  if $BREW list --formula "$formula" >/dev/null 2>&1; then
    echo "Uninstalling $formula"
    $BREW uninstall "$formula"
  fi
done

# Remove dead taps
for tap in caskroom/cask homebrew/cask-versions; do
  if $BREW tap | grep -qx "$tap"; then
    echo "Untapping $tap"
    $BREW untap "$tap"
  fi
done

$BREW cleanup
