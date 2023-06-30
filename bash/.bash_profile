#
# ~/.bash_profile
#

export EDITOR=micro
export VISUAL=micro
export PATH="$HOME/.local/bin:$PATH"
export FLYCTL_INSTALL="/home/thiago/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc
