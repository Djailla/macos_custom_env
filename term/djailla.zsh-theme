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
    [ $VIRTUAL_ENV ] && echo '(🐛  '`basename $VIRTUAL_ENV`') '
}

PROMPT='
[%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:%{$fg[yellow]%}%0~%{$reset_color%}] $(git_prompt_info)
$(virtualenv_info)$(prompt_char) '
