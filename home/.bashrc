if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh

export EDITOR=emacs
export PATH=$PATH:$HOME/bin
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages

if [[ $TERM == dumb && $INSIDE_EMACS ]]; then
    export TERM=dumb-emacs-ansi COLORTERM=1
fi

alias l="ls -hltrF --color"
alias gs="git status --short --branch"
alias gk="gitk --all"
alias nicaea="ssh jross@nicaea.usersys.redhat.com"
alias concordia="ssh jross@concordia.usersys.redhat.com"

umask 002
