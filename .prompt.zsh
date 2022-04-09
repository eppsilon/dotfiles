# References:
# - https://github.com/romkatv/gitstatus/blob/master/gitstatus.prompt.zsh
# - https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/dstufft.zsh-theme
# - https://github.com/belak/zsh-utils/blob/master/prompt/functions/prompt_belak_setup

function prompt_setup() {
  autoload -Uz add-zsh-hook

  if [[ $+functions[gitstatus_start] ]]; then
    gitstatus_stop 'prompt' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'prompt'
  fi

  add-zsh-hook precmd prompt_precmd
  setopt no_prompt_bang prompt_percent prompt_subst

  typeset -H end_time="%{$fg[yellow]%}%*%{$reset_color%}"
  typeset -H return_code="%(?.%{$fg_bold[green]%}✓.%{$fg_bold[red]%}⨯)%{$reset_color%}"
  typeset -H current_dir="%{$fg[blue]%}%~%{$reset_color%}"

  PROMPT="${end_time} ${return_code}"
  PROMPT+=$'\n'
  PROMPT+="${current_dir} %{$fg[magenta]%}➡︎%{$reset_color%} "
  RPROMPT='${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT}'
}

function prompt_gitstatus() {
  gitstatus_query 'prompt' || return 1 # error
  [[ $VCS_STATUS_RESULT == 'ok-sync' ]] || return 0 # not a git repo

  # local p

  # (( $VCS_STATUS_ACTION )) && p+="$fg_bold[red]$VCS_STATUS_ACTION%f "

  # local indicators
  # (( $VCS_STATUS_HAS_CONFLICTED )) && indicators+="%{$fg_bold[red]%}◼︎%{$reset_color%}"
  # (( $VCS_STATUS_HAS_UNTRACKED )) && indicators+="%{$fg_bold[magenta]%}●%{$reset_color%}"
  # (( $VCS_STATUS_HAS_UNSTAGED )) && indicators+="%{$fg_bold[yellow]%}▲%{$reset_color%}"
  # (( $VCS_STATUS_HAS_STAGED )) && indicators+="%{$fg_bold[green]%}▲%{$reset_color%}"
  # p+="$indicators "

  local      clean="%{$fg[green]%}"
  local   modified="%{$fg[yellow]%}"
  local  untracked="%{$fg[magenta]%}"
  local conflicted="%{$fg[red]%}"

  local p

  local where  # branch name, tag or commit
  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    where=$VCS_STATUS_LOCAL_BRANCH
  elif [[ -n $VCS_STATUS_TAG ]]; then
    p+='%f#'
    where=$VCS_STATUS_TAG
  else
    p+='%f@'
    where=${VCS_STATUS_COMMIT[1,8]}
  fi

  (( $#where > 32 )) && where[13,-13]="…"  # truncate long branch names and tags
  p+="${clean}${where//\%/%%}"             # escape %

  # ⇣42 if behind the remote.
  (( VCS_STATUS_COMMITS_BEHIND )) && p+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
  # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
  (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && p+=" "
  (( VCS_STATUS_COMMITS_AHEAD  )) && p+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
  # ⇠42 if behind the push remote.
  (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && p+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
  (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && p+=" "
  # ⇢42 if ahead of the push remote; no leading space if also behind: ⇠42⇢42.
  (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && p+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
  # *42 if have stashes.
  # (( VCS_STATUS_STASHES        )) && p+=" ${clean}*${VCS_STATUS_STASHES}"
  # 'merge' if the repo is in an unusual state.
  [[ -n $VCS_STATUS_ACTION     ]] && p+=" ${conflicted}${VCS_STATUS_ACTION}"
  # ~42 if have merge conflicts.
  (( VCS_STATUS_NUM_CONFLICTED )) && p+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
  # +42 if have staged changes.
  (( VCS_STATUS_NUM_STAGED     )) && p+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
  # !42 if have unstaged changes.
  (( VCS_STATUS_NUM_UNSTAGED   )) && p+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
  # ?42 if have untracked files. It's really a question mark, your font isn't broken.
  (( VCS_STATUS_NUM_UNTRACKED  )) && p+=" ${untracked}?${VCS_STATUS_NUM_UNTRACKED}"

  GITSTATUS_PROMPT="${p}%f"
  # The length of GITSTATUS_PROMPT after removing %f and %F.
  GITSTATUS_PROMPT_LEN="${(m)#${${GITSTATUS_PROMPT//\%\%/x}//\%(f|<->F)}}"
}

function prompt_precmd() {
  prompt_gitstatus
}

prompt_setup
