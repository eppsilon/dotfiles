if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit

unalias lt 2> /dev/null

# NVM
export NVM_DIR="/Users/brett/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Git aliases
alias gs='git status -sb'
alias ga='git add'
alias gd='git difftool -y -M'
alias gds='git difftool -y -M --cached'
alias gl='git log --oneline'
alias gmy='git mergetool -y'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gus='git reset HEAD'
alias gu='git checkout --'
alias gc='git checkout'
alias gsur='git submodule update --remote'
alias gsu='git submodule update --init'
alias gka='git commit --amend --date=now'
alias gk='git commit -m'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gpo='git push -u origin HEAD'
alias gpu='git push -u upstream HEAD'

# Docker aliases
alias d='docker'
alias dm='docker-machine'
alias dme='eval "$(docker-machine env default)"'
alias dmr='docker-machine restart default'
alias dc='docker-compose'

# NPM aliases
alias npml='npm ls --depth 0'
alias npmgl='npm -g ls --depth 0'
alias npmo='npm outdated'
alias npmgo='npm -g outdated'
alias npmi='npm install'
alias npmis='npm install -SE'
alias npmid='npm install -DE'
alias npmgi='npm -g install'
alias npms='npm start'
alias npmt='npm test'
alias npmc='npm test -- -cc -sr'

# Misc aliases
alias ls='ls -lahG'
alias npm='noglob npm'
alias zreload='source /Users/brett/.zshrc'
export ANDROID_HOME=/usr/local/opt/android-sdk
alias gdd='gd --dir-diff'
alias gdsd='gds --dir-diff'
alias isodate='date -u +%Y-%m-%dT%H:%M:%SZ'

# direnv
eval "$(direnv hook zsh)"

export PATH="$HOME/.yarn/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

