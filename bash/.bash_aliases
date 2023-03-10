alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -1hFsa'
alias df='df -h'
alias mv='mv -v'
alias cp='cp -v'
alias c='clear'
alias t='(tmux has-session 2>/dev/null && tmux attach) || (tmux new-session)'
alias cpr='rsync -ah --info=progress2'

alias apt='sudo apt'

alias uu='sudo apt-get update && sudo apt-get upgrade -y'
alias ports='echo --Listening TCP Ports-- && ss -tlpn && echo -e "\n--Listening UDP Ports--" && ss -ulpn'
alias myip='echo "Public IPv4 address: $(curl -m 5 --ipv4 --silent canhazip.com)"'
alias pg='ping google.com -c 5'
alias hist='history|grep'
alias quit='exit'

alias home='cd ~'
alias ...='cd ../..'
alias ....='cd ../../..'

alias sc='source ~/.bashrc'
