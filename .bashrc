if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh

#export PS1='\n\[\e[33m\]\w\[\e[m\]$(__git_ps1 " (%s)")\[\e[36m\]\$\[\e[m\] '
export PS1='\n\[\e[33m\]\w\[\e[m\]\[\e[36m\]\$\[\e[m\] '
export EDITOR=emacs
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/sbin:$HOME/.local/node_modules/.bin:$PATH
export NODE_PATH=$HOME/.local/lib/node_modules:/usr/lib/node_modules:$NODE_PATH

if [[ $TERM == dumb && $INSIDE_EMACS ]]; then
    export TERM=dumb-emacs-ansi COLORTERM=1
fi

alias cat="bat --theme base16 --number"

alias j="jobs"
alias l="ls -l --almost-all --human-readable --no-group --sort time"
alias ls="ls --color"
alias m="make"
alias p="pwd"
alias pl="plano"
alias py="python3"
alias s="rg"
alias x='echo $?'

alias gd="git diff --minimal"
alias gl="git log --format='tformat:%C(auto)%h  %C(blue)%<(8,trunc)%al  %<(14,trunc)%cr  %C(auto)%d %C(auto)%s' -n 20"
alias gp="git pull --autostash"
alias gs="git status --short --branch"
alias gwip="git commit -am WIP"
alias gbump="git commit -m 'Bump' --allow-empty"

alias sc="systemctl"
alias jc="journalctl"

alias gdbt="gdb -ex run -ex 'thread apply all bt' -ex 'set confirm off' -ex quit --args"

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

function mdcd {
    if [[ $1 ]]; then
        mkdir -p $1
        cd $1
    else
        cd $(mktemp -d)
    fi
}

alias mk="minikube"
alias sk="skupper"

alias kc="kubectl"
alias kcd="kubectl get deployments"
alias kcp="kubectl get pods"
alias kcs="kubectl get services"
alias kcl="kubectl logs"

function kcn {
    if [[ $1 ]]; then
        kubectl config set-context --current --namespace "$1"
    fi

    kubectl config view --minify --output 'jsonpath={..namespace}'; echo
}

function kcsh {
    kubectl exec -it "$1" -- /bin/bash
}

function kubecfg {
    if [[ $1 ]]; then
        if [[ $1 = "-" ]]; then
            unset KUBECONFIG
        else
            export KUBECONFIG="$HOME/.kube/config-$1"
        fi
    fi

    echo KUBECONFIG=$KUBECONFIG
}

unset command_not_found_handle

umask 002

# Wasmer
export WASMER_DIR="/home/jross/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
