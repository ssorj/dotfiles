if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh

export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export EDITOR=emacs
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/sbin:$HOME/.local/node_modules/.bin:$PATH
export NODE_PATH=$HOME/.local/lib/node_modules:$NODE_PATH

if [[ $TERM == dumb && $INSIDE_EMACS ]]; then
    export TERM=dumb-emacs-ansi COLORTERM=1
fi

alias ls="ls --color"
alias l="ls -hltrF"
alias gs="git status --short --branch"
alias gd="git diff"
alias gl="git log --oneline -20"
alias gk="gitk --all"
alias s="ack -s --literal --sort-files --ignore-dir bld --ignore-dir build"
alias p="pwd"

function f {
    if [[ -z $1 ]] || [[ ${1:0:1} = "-" ]]; then
        find . "$@"
    else
        find . -name "$@"
    fi
}

function hpost {
    curl -H 'Content-type: text/plain' -i -d $2 $1
}

alias docker="sudo docker"

unset command_not_found_handle

umask 002
