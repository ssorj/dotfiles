if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh

export EDITOR=emacs
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/sbin:$PATH
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$HOME/.local/lib64/python2.7/site-packages

if [[ $TERM == dumb && $INSIDE_EMACS ]]; then
    export TERM=dumb-emacs-ansi COLORTERM=1
fi

alias ls="ls --color"
alias l="ls -hltrF"
alias gs="git status --short --branch"
alias gd="git diff"
alias gk="gitk --all"
alias nicaea="ssh jross@nicaea.usersys.redhat.com"
alias concordia="ssh jross@concordia.usersys.redhat.com"

umask 002
