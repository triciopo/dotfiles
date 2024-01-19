#
# ~/.bash_profile
#

export EDITOR=micro
export VISUAL=micro
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

[[ -f ~/.bashrc ]] && . ~/.bashrc
