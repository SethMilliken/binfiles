# araxia
# zsh theme requires 256 color enabled terminal
# i.e TERM=xterm-256color
#
# plugins required: vcs, vi-mode, git, svn

## Main Prompt # {{{
PROMPT=''
PROMPT+='%{$bg[white]%}%{$fg_bold[grey]%}'
PROMPT+=' %! '                                     #  command number
PROMPT+='%{$reset_color%}'
PROMPT+='$(shell_depth)'
PROMPT+='[ '
PROMPT+='%B%F{208}%n%f%{$fg[white]%}@%F{039}%m%f'  #  user@host (orange@blue)
PROMPT+='%{$reset_color%}'
PROMPT+=' ]'
PROMPT+='%{$reset_color%}'
PROMPT+='%{$bg[green]%}%{$fg[white]%}'
PROMPT+=' %j '                                     #  child jobs
PROMPT+='%{$reset_color%}'
PROMPT+='$(vcs_status_prompt)'
PROMPT+='[ '
PROMPT+='%F{178}%~%f'                              #  path (orange)
PROMPT+=' ]'
PROMPT+=' %# '
PROMPT+='%{$reset_color%}'

# }}} main
## Right Prompt # {{{
RPROMPT=''
RPROMPT+='$(vi_mode_prompt_info)'
RPROMPT+='$(exit_status)'
RPROMPT+='%{$fg_bold[green]%}'
RPROMPT+='[%*]'
RPROMPT+='%{$reset_color%}'

# }}}
## General VCS # {{{
#ZSH_THEME_VCS_TIME_VERBOSE=true


# }}} vcs
## git # {{{
ZSH_THEME_GIT_PROMPT_PREFIX="("
#
# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[white]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"

ZSH_THEME_GIT_PROMPT_SUFFIX=")"

# }}} git
## hg # {{{
ZSH_THEME_HG_PROMPT_PREFIX="("
ZSH_THEME_HG_PROMPT_SHA_BEFORE="%{$fg[green]%}"
ZSH_THEME_HG_PROMPT_SHA_AFTER="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX=")"

# }}} hg
## svn # {{{
ZSH_THEME_SVN_PROMPT_PREFIX="("
ZSH_THEME_SVN_PROMPT_SUFFIX=")"

# }}} svn
## vi mode # {{{
MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"

# }}}
## Functions # {{{

# example of how to override a vcs_prompt defaults:
# function _vcs_prompt_git() {
#     local prompt=''
#     prompt+="${ZSH_THEME_GIT_PROMPT_SYMBOL}"
#     prompt+="${ZSH_THEME_REPO_NAME_COLOR}"
#     prompt+="$(current_branch)"
#     prompt+="%{$reset_color%}"
#     prompt+="| "
#     prompt+="$(_vcs_dirt_age_git)"
#     prompt+="| "
#     prompt+="$(_vcs_dirt_status_git)"
#     echo $prompt
# }
#
# function _vcs_prompt_hg() {
#     echo $(hg_prompt_long_sha)
# }

function shell_depth() {
  local level=$SHLVL
  ((level--))
  if [[ $STY != "" || $TMUX != "" ]]; then # ignore screen and tmux
    ((level--))
  fi
  if [[ $level -gt 0 ]]; then
    local result=''
    result+="%{$fg[red]%}%{$bg[white]%}"
    result+="⇣"
    result+="${level}"
    result+="%{$reset_color%}"
    echo $result
  fi
}

function exit_status() {
  if [[ $? -gt 0 ]]; then
    local result=''
    result+="%{$fg[white]%}%{$bg[red]%}"
    result+=" %? "
    result+="%{$reset_color%}"
  fi
}

# }}} functions
# vim: ft=zsh:fdm=marker
