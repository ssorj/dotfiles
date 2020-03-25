if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh

export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export EDITOR=emacs
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/sbin:$HOME/.local/node_modules/.bin:$PATH
export NODE_PATH=$HOME/.local/lib/node_modules:/usr/lib/node_modules:$NODE_PATH

if [[ $TERM == dumb && $INSIDE_EMACS ]]; then
    export TERM=dumb-emacs-ansi COLORTERM=1
fi

alias j="jobs"
alias l="ls -hltrF"
alias ls="ls --color"
alias m="make"
alias p="pwd"
alias s="ack -s --literal --sort-files --ignore-dir bld --ignore-dir build --ignore-dir .git"

alias gd="git diff --minimal"
alias gk="gitk --all"
alias gl="git log --oneline -20"
alias gp="git pull --autostash"
alias gs="git status --short --branch"

function f {
    if (( $# == 0 )); then
        find . -name .git -prune -o -print
    elif (( $# == 1 )); then
        if [[ -d $1 ]]; then
            find "$1" -name .git -prune -o -print
        else
            find . -name .git -prune -o -name "*${1}*" -print
        fi
    elif (( $# == 2 )); then
        find "$1" -name .git -prune -o -name "*${2}*" -print
    else
        return 1;
    fi
}

alias docker="sudo docker"
alias kc="kubectl"
alias mk="minikube"
alias py="python3"

unset command_not_found_handle

umask 002
