# Custom ZSH Theme

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '⇒'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '(🐍  '`basename $VIRTUAL_ENV`') '
}

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=''
    EXIT_CODE_PROMPT+="%{$fg[red]%}{%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}}%{$reset_color%}"
    echo "$EXIT_CODE_PROMPT"
  else
    local EXIT_CODE_PROMPT=''
    EXIT_CODE_PROMPT+="%{$fg[green]%}{%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[green]%}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[green]%}}%{$reset_color%}"
    echo "$EXIT_CODE_PROMPT"
  fi
}

PROMPT='$(check_last_exit_code) [%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:%{$fg[yellow]%}%0~%{$reset_color%}] $(virtualenv_info)
$(prompt_char) '

RPROMPT='$(git_prompt_info)'
