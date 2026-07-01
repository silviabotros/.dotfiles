<!--
ABOUTME: Changelog for the dotfiles repo, tracking notable config and script changes.
ABOUTME: Follows Keep a Changelog conventions; newest entries at the top.
-->

# Changelog

## 2026-07-01

Audit of all configs and scripts against macOS Tahoe 26. Removed settings for
features Apple has deleted, fixed options that error on current tool versions,
and dropped Ruby tooling and local MySQL management entirely.

### Removed

- **macos.sh**: Dashboard settings (feature removed in macOS Catalina), all
  `BluetoothAudioAgent` bitpool tweaks and the aptX/`com.apple.blued` block
  (Bluetooth stack rewritten in Big Sur; daemon no longer exists), the Safari
  `defaults write` block (Safari is sandboxed and ignores these), the
  `LSQuarantine` Gatekeeper bypass (no longer honored, and a security
  downgrade), and `pmset hibernatemode 0` (unsupported on Apple Silicon
  laptops).
- **brews.sh**: dead `caskroom/cask` taps and the deprecated
  `homebrew/cask-versions` tap, the unmaintained `thefuck` formula, and a
  `cp` of CLAUDE.md that pointed at a wrong path and clobbered the symlink
  managed by symlinks.sh.
- **apps.sh**: Atom `apm` package installs (Atom was sunset in December 2022).
- **zsh.sh**: `brew install zsh` and both `chsh` calls — zsh has been the
  macOS default shell since Catalina, and one `chsh` pointed at the Intel
  Homebrew path.
- **install.sh**: calls to `installMySQL`, a function that was never defined;
  the commented-out ruby-based Homebrew installer.
- **aliases**: `start_mysql`/`stop_mysql` (used `/Library/StartupItems`,
  removed from macOS years ago) and the duplicated SendGrid-internal
  `ss`/`hayo` aliases.
- **gitconfig**: the `[filter "media"]` block — git-media is long dead
  (superseded by git-lfs) and `required = true` breaks repos that reference
  the filter.
- **tmux.conf**: abandoned `tmux-copycat` plugin (tmux ≥ 3.1 has native regex
  search).
- **Ruby tooling**: deleted `config/Gemfile` and `config/gemrc` (dead gem
  sources, flags removed in RubyGems 3), removed their symlinks from
  symlinks.sh, dropped `.ruby-version`/`Gemfile.lock` from gitignore_global,
  and removed the `vim-ruby` and `vim-rails` plugins from the vimrc.

### Changed

- **macos.sh**: quits "System Settings" instead of "System Preferences"
  (renamed in Ventura); hot-corner comments now match the keys they set, and
  dead corner values (Dashboard, Launchpad) are gone from the reference table;
  the `ConfigDataInstall` comment now describes what the key actually does.
- **brews.sh / install.sh**: neovim installs from the core formula instead of
  the long-dead `neovim/neovim` tap, without the `--HEAD` reinstall.
- **tmux.conf**: options removed in tmux 2.9 converted to their `-style`
  equivalents (`window-status-current-style`, `window-status-activity-style`,
  `message-style`, `pane-border-style`, `pane-active-border-style`);
  `default-terminal` is now `tmux-256color`; battery plugin switched from
  `tmux-battery-osx` to its successor `tmux-plugins/tmux-battery`.
- **gitconfig**: `push.default` changed from `matching` (pre-git-2.0 behavior)
  to `simple`.
- **aliases**: `json` uses `python3` — Apple removed the `python` binary in
  macOS 12.3.

### Added

- **scripts/cleanup.sh**: removes machine-level leftovers from this audit —
  dead symlinks in `$HOME` that point at files no longer in the repo, brew
  packages dropped from brews.sh (`thefuck`), and the dead `caskroom/cask`
  and `homebrew/cask-versions` taps. Wired into install.sh as menu option
  `c`.
- **install.sh**: `installTmux` now clones tpm so tmux plugins install on a
  fresh machine.

### Fixed

- **zsh.sh**: oh-my-zsh installer fetched from `raw.githubusercontent.com`
  instead of the legacy redirecting `raw.github.com`; `mkdir -p` so reruns
  don't error.
