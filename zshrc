#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
eval "$(rbenv init -)"

#source /usr/local/opt/chruby/share/chruby/chruby.sh
#source /usr/local/opt/chruby/share/chruby/auto.sh

RUBIES+=(~/.rbenv/versions/*)

export NVM_DIR="/Users/andrew.mcnamara/.nvm"
. $(brew --prefix nvm)/nvm.sh

#source $HOME/bin/proxy.sh
#
export EDITOR=vim
export VISUAL=atom

alias tml='tmux list-sessions'
alias tma='tmux -2 attach -t $1'
alias tmk='tmux kill-session -t $1'

export ANDROID_HOME=/usr/local/opt/android-sdk
