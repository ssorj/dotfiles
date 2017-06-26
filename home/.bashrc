if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh

export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export EDITOR=emacs
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/sbin:$HOME/.local/node_modules/.bin:$PATH

export C_INCLUDE_PATH=$HOME/.local/include:/usr/local/include:/usr/include
export CPLUS_INCLUDE_PATH=$C_INCLUDE_PATH
export LIBRARY_PATH=$HOME/.local/lib64:/usr/local/lib64:/usr/lib64
export LD_LIBRARY_PATH=$LIBRARY_PATH
export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$HOME/.local/lib64/python2.7/site-packages

if [[ $TERM == dumb && $INSIDE_EMACS ]]; then
    export TERM=dumb-emacs-ansi COLORTERM=1
fi

alias ls="ls --color"
alias l="ls -hltrF"
alias gs="git status --short --branch"
alias gd="git diff"
alias gk="gitk --all"
alias docker="sudo docker"
alias nicaea="ssh jross@nicaea.usersys.redhat.com"
alias concordia="ssh jross@concordia.usersys.redhat.com"

umask 002
