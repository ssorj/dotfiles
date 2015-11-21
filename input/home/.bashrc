if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

umask 002

alias l="ls -hltrF"
alias nicaea="ssh jross@nicaea.usersys.redhat.com"
alias concordia="ssh jross@concordia.usersys.redhat.com"
