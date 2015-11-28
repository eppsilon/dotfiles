if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit

unalias lt

alias gs='git status -sb'
alias ga='git add'
alias gd='git difftool -y'
alias gds='git difftool -y --cached'
alias gl='git log --oneline'
alias gmy='git mergetool -y'
alias grc='git rebase --continue'
alias gus='git reset HEAD'
alias gu='git checkout --'

alias d='docker'
alias dm='docker-machine'
alias dme='eval "$(docker-machine env default)"'
alias dmr='docker-machine restart default'
alias dc='docker-compose'

alias ls='ls -lahG'
