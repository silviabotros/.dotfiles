ZSH=$HOME/.oh-my-zsh
ZSH_THEME="theunraveler"  #avit kennethreitz mrtazz muse theunraveler wezm

CASE_SENSITIVE="true"

DISABLE_AUTO_TITLE="true"
# Cannot turn this back on until tmux and csshx play nice again
#ZSH_TMUX_AUTOSTART="true"
REPORTTIME=10

plugins=(git eddiezane brew bundler common-aliases dircycle gitfast git-extras git-flow knife  sudo tmux zsh-syntax-highlighting tmuxinator z docker last-working-dir)

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Justin is smart
alias :q="exit"

source $ZSH/oh-my-zsh.sh

unsetopt auto_name_dirs
# thanks @whack
setopt append_history            # Append to history on exit, don't overwrite it.
setopt extended_history          # Save timestamps with history
setopt hist_no_store             # Don't store history commands
setopt hist_save_no_dups         # Don't save duplicate history entries
setopt hist_ignore_all_dups      # Ignore old command duplicates (in current session)


# make and cd
function mkcd
{
    dir="$*";
    mkdir -p "$dir" && cd "$dir";
}

function name_dat_tmux
{
  if [ "$TMUX" ]; then
    if [ "$PWD" != "$OLDPWD" ]; then
      OLDPWD="$PWD";
      tmux rename-window ${PWD##*/};
    fi
  fi
}

precmd_functions+='name_dat_tmux'


function ssh {
  if [[ $# == 0 || -z $TMUX ]]; then
    command ssh $@
    return
  fi
  local remote=${${(P)#}#*@*}
  local old_name="$(tmux display-message -p '#W')"
  local renamed=0
  if [[ $remote != -* ]]; then
    renamed=1
    tmux rename-window $remote
  fi
  command ssh $@
  if [[ $renamed == 1 ]]; then
    tmux rename-window "$old_name"
  fi
}


# Check if on Mac
# if [[ `uname` == "Darwin" ]]; then
#   export BROWSER=open
#   export EDITOR=vim
#  # source ~/.dotfiles/API_KEYS
#   export GOPATH=~/.go
#   export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/heroku/bin:$GOPATH:/Applications/android-sdk-macosx/platform-tools:/Applications/android-sdk-macosx/tools:$PATH
#   if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# else
#   [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#   export PATH=$HOME/.rvm/bin:$PATH
# fi
export PATH=/usr/local/bin:$PATH
ssh-add -l &>/dev/null
if [[ $? == 1 ]]; then
  ssh-add &>/dev/null
fi

# Thanks https://github.com/csmcdermott
# This is for the pesky known_hosts error
function delhost() {
  sed -i -e "$@" ~/.ssh/known_hosts
}

# Make killing servers simple
function dechef() { knife node delete "$@"; knife client delete "$@"; }

# sensu-cli
function sjsensu() { ln -sf ~/.sensu/settings_sjc.rb ~/.sensu/settings.rb; sensu "$@"; }
function mdsensu() { ln -sf ~/.sensu/settings_mdw.rb ~/.sensu/settings.rb; sensu "$@"; }
function lasensu() { ln -sf ~/.sensu/settings_las.rb ~/.sensu/settings.rb; sensu "$@"; }

# collins CLI
function sjcollins() { collins-shell "$@" --config=~/.collins-sjc.yaml; }
function lascollins() { collins-shell "$@" --config=~/.collins-las.yaml; }
function mdwcollins() { collins-shell "$@" --config=~/.collins-mdw.yaml; }

# cssh-role
# Thanks https://github.com/richard2191
function cssh-role() {
if [ -z $1 ]; then
  echo -e "Usage: cssh-role [role_name] [chef_environment] [ldap_username]\n       [chef_environment] and [ldap_username] are optional"
  return 0
fi

if [ -z $2 ]; then
  CHEF_ENV="production"
else
  CHEF_ENV=$2
fi

if [ -z $3 ]; then
  LDAP_USER="silvia"
else
  LDAP_USER=$3
fi

$(knife ssh "roles:$1 AND chef_environment:*${CHEF_ENV}*" -x ${LDAP_USER} cssh)

}

# Aliases
alias ll='ls -alG'
alias psgrep='ps aux | fgrep '
alias mysql='mycli'
alias start_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM start"
alias stop_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM stop"
alias pylint="pylint --rcfile=~/pylintrc"
alias untar='tar -xvf'
alias killdock='killall -KILL Dock'
alias gu='git-up'
alias git-pr='git push -u origin HEAD'
alias sl='/usr/local/bin/sl'
alias ss='/usr/local/bin/ss'
alias hayo='/usr/local/bin/hayo'
alias json='python -m json.tool'
alias vim='nvim'

source '/Users/silviabotros/.exports'
# Adding chefdk to the path explicitly
export PATH=/opt/chefdk/bin:$PATH
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/silviabotros/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Go code
export GOPATH=$HOME/go

# MySQL prompt
export MYSQL_PS1="[\D]\n\u@\h:\p:[\d]> "

plugins+=(hipchat)
eval "$(chef shell-init zsh)"
source /Users/silviabotros/.hipchat
#source /Users/silviabotros/.iterm2_shell_integration.zsh
