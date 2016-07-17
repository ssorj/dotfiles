if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh

export EDITOR=emacs
export PATH=$PATH:$HOME/bin
export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages

umask 002

alias l="ls -hltrF"
alias gs="git status --short; git branch"
alias gk="gitk --all"
alias nicaea="ssh jross@nicaea.usersys.redhat.com"
alias concordia="ssh jross@concordia.usersys.redhat.com"

