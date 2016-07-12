if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

umask 002

alias l="ls -hltrF"
alias gs="git status"
alias gk="gitk --all"
alias nicaea="ssh jross@nicaea.usersys.redhat.com"
alias concordia="ssh jross@concordia.usersys.redhat.com"
