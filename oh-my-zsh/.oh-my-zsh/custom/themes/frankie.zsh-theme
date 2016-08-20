#!/usr/bin/env zsh

# Based on muse theme

setopt promptsubst

autoload -U add-zsh-hook

PROMPT_SUCCESS_COLOR=$fg[green]
PROMPT_FAILURE_COLOR=$fg[red]
#PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$fg[cyan]
GIT_DIRTY_COLOR=$fg[red]
GIT_CLEAN_COLOR=$fg[green]
GIT_PROMPT_INFO=$fg[blue]

local return_code="%(?.%{$PROMPT_SUCCESS_COLOR%}❯%{$reset_color%}.%{$PROMPT_FAILURE_COLOR%}%? ↵%{$reset_color%})"

PROMPT='%{$PROMPT_PROMPT%}%~%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}$return_code '

#RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✓"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[blue]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[yellow]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[white]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}✭%{$reset_color%}"
