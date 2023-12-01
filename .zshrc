# References: https://github.com/belak/dotfiles

# let me append to a nonexistent file, dammit
setopt clobber

# Set up zplug
[[ ! -d "$HOME/.zplug" ]] && git clone https://github.com/zplug/zplug "$HOME/.zplug"
source "$HOME/.zplug/init.zsh"
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Add plugins
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "romkatv/gitstatus"
zplug "zdharma/fast-syntax-highlighting", defer:2

# Install and load ZSH plugins
! zplug check && zplug install
zplug load

# Prompt
[[ -v ITERM_SESSION_ID ]] && source "$HOME/.prompt.zsh"

# Install zsh-async if it's not present
[[ ! -a ~/.zsh-async ]] && git clone git@github.com:mafredri/zsh-async.git ~/.zsh-async
source ~/.zsh-async/async.zsh

# NVM
[[ ! -d "$HOME/.nvm" ]] && git clone https://github.com/creationix/nvm "$HOME/.nvm"
function load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}

# Load NVM async (https://github.com/nvm-sh/nvm/issues/539#issuecomment-403661578)
async_start_worker nvm_worker -n
async_register_callback nvm_worker load_nvm
async_job nvm_worker sleep 0.1

# Git aliases
alias gs='git status -sb'
alias gl='git log --format='"'%Cblue %as %Cred %h %Creset %<(80,trunc)%s %Cgreen %<(10,trunc)%cL %Creset %D'"
alias ga='git add'
alias gap='git add -p'
alias gd='git difftool -y -M'
alias gds='git difftool -y -M --cached'
alias gdd='gd --dir-diff'
alias gdds='gds --dir-diff'
alias gmy='git mergetool -y'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gus='git reset HEAD'
alias gu='git checkout --'
alias gc='git checkout'
alias gka='git commit --amend --date=now'
alias gk='git commit -m'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gpo='git push -u origin HEAD'
alias gpof='git push -u origin --force-with-lease HEAD'
alias gpu='git push -u upstream HEAD'
alias gss='git stash save'
alias gsp='git stash pop'
alias gcp='git cherry-pick'
alias gcpn='git cherry-pick -n'
alias gcpc='git cherry-pick --continue'
alias gcps='git cherry-pick --skip'

# NPM aliases
alias npms='npm start'
alias npmt='npm test'
alias npmc='npm test -- -cc -sr'

# Misc aliases
alias ls='eza -la'
alias npm='noglob npm'
alias yarn='noglob yarn'
alias zreload="source $HOME/.zshrc"
alias isodate='date -u +%Y-%m-%dT%H:%M:%SZ'

# direnv
eval "$(direnv hook zsh)"

# iterm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# make the history command useful
alias history="history 1"
HISTSIZE=99999
HISTFILESIZE=99999
SAVEHIST=$HISTSIZE

# use local history (https://superuser.com/a/1025836)
setopt share_history
up-line-or-local-history() {
  zle set-local-history 1
  zle up-line-or-history
  zle set-local-history 0
}
zle -N up-line-or-local-history
down-line-or-local-history() {
  zle set-local-history 1
  zle down-line-or-history
  zle set-local-history 0
}
zle -N down-line-or-local-history
bindkey '^[OA' up-line-or-local-history     # Cursor up
bindkey '^[OB' down-line-or-local-history   # Cursor down
bindkey '^[[1;5A' up-line-or-history        # [CTRL] + Cursor up
bindkey '^[[1;5B' down-line-or-history      # [CTRL] + Cursor down

# McFly!
eval "$(mcfly init zsh)"

# broot
source /Users/brett/.config/broot/launcher/bash/br

# Command to copy + optimize a Material Design icon
function mdi() {
  setopt verbose
  nocorrect cp -i "$HOME/repos/Templarian/MaterialDesign/svg/$1.svg" "src/assets/images/icons/$1-icon.svg"
  svgo -q "src/assets/images/icons/$1-icon.svg"
  unsetopt verbose
}

# Command to get brew formulae that depend on a given formula
function brew-ancestors() {
  brew deps -1 --installed | grep ":.*$1" | awk -F':' '{print $1}'
}
