# ------------------------------------------------------------------------------
#          FILE:  tUrG0n.zsh-theme
#   DESCRIPTION:  oh-my-zsh theme file.
#        AUTHOR:  Piotr Yordanov (piotr.yordanov@gmail.com)
#       VERSION:  1.0.0
#    SCREENSHOT:
# ------------------------------------------------------------------------------

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '☿ ' && return
    hg root >/dev/null 2>/dev/null && echo '±' && return
    echo '±  '
}

PROMPT='$FG[237]------------------------------------------------------------%{$reset_color%}
$fg_bold[blue]╭─ %{$fg_bold[cyan]%}☁ %{$fg_bold[green]%}% %{$fg[green]%} %~ %{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%} 
╰─ $(prompt_char)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"

return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

RPROMPT='${return_code}$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
