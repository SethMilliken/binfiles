# zsh theme requires 256 color enabled terminal
# i.e TERM=xterm-256color
# based on ?

PROMPT=''
PROMPT+='%{$bg_bold[white]%}%{$fg_bold[grey]%} %! '         # command number
PROMPT+='%{$reset_color%}'
PROMPT+='[ '
PROMPT+='%B%F{208}%n%f%{$fg_bold[white]%}@%F{039}%m%f%{$reset_color%}' # host
PROMPT+=' ]'
PROMPT+='%{$reset_color%}'
PROMPT+='%{$bg[green]%}%{$fg_bold[grey]%} %j ' # child jobs
PROMPT+='%{$reset_color%}'
PROMPT+='$(git_time_since_commit)'
PROMPT+='$(git status -s | git dirt)'
PROMPT+='$(git_prompt_info)'
PROMPT+='[ '
PROMPT+='%F{208}%c%f'
PROMPT+=' ]'
#PROMPT+='$(git_prompt_status)'
#PROMPT+='$(svn_prompt_info)'
PROMPT+=' %# '
PROMPT+='%{$reset_color%}'

RPROMPT=''
RPROMPT+='$(vi_mode_prompt_info)'
RPROMPT+='%{$reset_color%}'
RPROMPT+='%{$fg[green]%}[%*]'
RPROMPT+='%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{154}±%f%F{124}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
#ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}%B✘%b%F{154}%f%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%F{154}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[blue]%}═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}✭"

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[white]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"

MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"
#RPROMPT='${return_status}$(git_prompt_status)%{$reset_color%}'

function prompt_char() {
  git branch >/dev/null 2>/dev/null && echo "%{$fg[green]%}±%{$reset_color%}" && return
  hg root >/dev/null 2>/dev/null && echo "%{$fg_bold[red]%}☿%{$reset_color%}" && return
  echo "%{$fg[cyan]%}◯ %{$reset_color%}"
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Only proceed if there is actually a commit.
        echo -n "("
        if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
            # Get the last commit.
            last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
            now=`date +%s`
            seconds_since_last_commit=$((now-last_commit))

            # Totals
            MINUTES=$((seconds_since_last_commit / 60))
            HOURS=$((seconds_since_last_commit/3600))

            # Sub-hours and sub-minutes
            DAYS=$((seconds_since_last_commit / 86400))
            SUB_HOURS=$((HOURS % 24))
            SUB_MINUTES=$((MINUTES % 60))

            if [[ -n $(git status -s 2> /dev/null) ]]; then
                if [ "$MINUTES" -gt 30 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
                elif [ "$MINUTES" -gt 10 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
                else
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
                fi
            else
                COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            fi

            if [ "$HOURS" -gt 24 ]; then
                #echo "$COLOR${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m%{$reset_color%}|"
                echo "$COLOR${DAYS}d%{$reset_color%}|"
            elif [ "$MINUTES" -gt 60 ]; then
                #echo "$COLOR${HOURS}h${SUB_MINUTES}m%{$reset_color%}|"
                echo "$COLOR${HOURS}h%{$reset_color%}|"
            else
                echo "$COLOR${MINUTES}m%{$reset_color%}|"
            fi
        else
            COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            echo "$COLOR~|"
        fi
    fi
}
