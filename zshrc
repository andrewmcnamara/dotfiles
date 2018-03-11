#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Customize to your needs...
eval "$(rbenv init -)"

#source /usr/local/opt/chruby/share/chruby/chruby.sh
#source /usr/local/opt/chruby/share/chruby/auto.sh

RUBIES+=(~/.rbenv/versions/*)

#export NVM_DIR="/Users/andrew.mcnamara/.nvm"
#. $(brew --prefix nvm)/nvm.sh

#source $HOME/bin/proxy.sh
#
#
#if [[ ! -d ~/.zplug ]];then
##    git clone https://github.com/b4b4r07/zplug ~/.zplug
#fi
#
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Async for zsh, used by pure
zplug "mafredri/zsh-async", from:github, defer:0
# Load completion library for those sweet [tab] squares
zplug "lib/completion", from:oh-my-zsh
# Syntax highlighting for commands, load last
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
# Theme!
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug load


function cv() {
fzf --preview '[[ $(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 (highlight -O ansi -l {} ||
                  coderay {} ||
                  rougify {} ||
                  cat {}) 2> /dev/null | head -500'
}

#export FZF_DEFAULT_COMMAND='rg --files --hidden --smartcase --glob "!.git/*"'
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

export EDITOR=vim
export VISUAL=atom

alias tml='tmux list-sessions'
alias tma='tmux -2 attach -t $1'
alias tmk='tmux kill-session -t $1'

export ANDROID_HOME=/usr/local/opt/android-sdk
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
