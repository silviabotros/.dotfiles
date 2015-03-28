ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"
CASE_SENSITIVE="true"

DISABLE_AUTO_TITLE="true"
# Cannot turn this back on until tmux and csshx play nice again
#ZSH_TMUX_AUTOSTART="true"
REPORTTIME=10

plugins=(git eddiezane brew bundler common-aliases dircycle gitfast git-extras git-flow jira knife  sudo tmux zsh-syntax-highlighting tmuxinator z docker last-working-dir)

# Justin is smart
alias :q="exit"

source $ZSH/oh-my-zsh.sh

unsetopt auto_name_dirs

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

ssh-add -l &>/dev/null
if [[ $? == 1 ]]; then
  ssh-add &>/dev/null
fi

#my functions for the many chef servers
function sjcknife() { knife "$@" -c ~/.chef/knife-sjc.rb ;}
function 11knife() { knife "$@" -c ~/.chef/knife-11.rb ;}
function allknife() {
  echo SJC ...
    knife "$@" -c ~/.chef/knife-sjc.rb
      if [ $? -ne 0 ]; then
        echo SJC failed
        return 1
      fi
      echo SoftLayer ...
      knife "$@" -c ~/.chef/knife-sl.rb
      if [ $? -ne 0 ]; then
        echo SL failed
        return 1
      fi
      echo done.
}

function sjcdechef() { sjcknife node delete "$@"; sjcknife client delete "$@"; }
function 11dechef() { 11knife node delete "$@"; 11knife client delete "$@"; }

# sensu-cli
function sjsensu() { ln -sf ~/.sensu/settings_sjc.rb ~/.sensu/settings.rb; sensu "$@"; }
function mdsensu() { ln -sf ~/.sensu/settings_mdw.rb ~/.sensu/settings.rb; sensu "$@"; }

# cssh-role
function cssh-role() {
if [ -z $1 ]; then
  echo -e "Usage: cssh-role [role_name] [chef_environment] [ldap_username]\n       [chef_environment] and [ldap_username] are optional"
fi

if [ -z $2 ]; then
  CHEF_ENV="production_sjc"
else
  CHEF_ENV=$2
fi

if [ -z $3 ]; then
  LDAP_USER="rthe"
else
  LDAP_USER=$3
fi

SERVERS=`knife search node "roles:$1 AND chef_environment:${CHEF_ENV}" | grep FQDN | awk '{print $2}'`

COMMAND="cssh"

for SERVER in ${SERVERS[*]}; do
  COMMAND="${COMMAND} ${LDAP_USER}@${SERVER}"
done

echo ${COMMAND}
${COMMAND}

}

# Aliases
alias ll='ls -alG'
alias psgrep='ps aux | fgrep '
alias mysql='/usr/local/bin/mysql'
alias start_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM start"
alias stop_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM stop"
alias pylint="pylint --rcfile=~/pylintrc"
alias untar='tar -xvf'
alias killdock='killall -KILL Dock'
alias gu='git-up'
alias sl='/usr/local/bin/sl'
alias ss='/usr/local/bin/ss'
alias hayo='/usr/local/bin/hayo'
alias json='python -m json.tool'

source '/Users/silviabotros/.exports'
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/silviabotros/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
plugins+=(hipchat)
eval "$(chef shell-init zsh)"
