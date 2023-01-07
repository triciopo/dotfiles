######################################################################
#
#
#           ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#           ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#           ██████╔╝███████║███████╗███████║██████╔╝██║     
#           ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#           ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#           ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
#
######################################################################
GOPATH=$HOME/go
export EDITOR=micro
export VISUAL=micro

set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return 

# Powerline (https://github.com/justjanne/powerline-go)
function _update_ps1() { PS1="$($GOPATH/bin/powerline-go -error $? -jobs $(jobs -p | wc -l))"; }
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"; fi 

# Bash History
HISTCONTROL=ignoredups
HISTTIMEFORMAT="%F %T "
HISTSIZE=2000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
shopt -s cmdhist

# Load aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Bash completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
