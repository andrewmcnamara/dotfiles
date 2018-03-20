# ZSH history
setopt append_history
setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_ignore_all_dups
setopt hist_lex_words
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt inc_append_history
setopt hist_save_no_dups
setopt share_history

export HISTSIZE=11000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

# ZPLUG
source ~/dotfiles/zplug
source ~/dotfiles/aliases
#source $HOME/bin/proxy.sh
#
export GOPATH=~/go
export EDITOR=vim
export VISUAL=atom

if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
#  source ~/.gnupg/.gpg-agent-info
# export GPG_AGENT_INFO
  GPG_TTY=$(tty)
  export GPG_TTY
else
  eval $(gpg-agent --daemon)
fi


alias tml='tmux list-sessions'
alias tma='tmux -2 attach -t $1'
alias tmk='tmux kill-session -t $1'
alias be='bundle exec'

export ANDROID_HOME=/usr/local/opt/android-sdk

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

export PATH="/usr/local/bin:$HOME/.bin:$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
