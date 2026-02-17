if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

shopt -s failglob

export PROMPT_COMMAND=_prompt_command

_prompt_command() {
    local exit_code=$?

    PS1="\n\[\033[1;33m\]\\w\[\033[1;36m\]\$\[\033[0m\] "

    if [[ $exit_code != 0 ]]; then
        PS1="\[\033[1;31m\]-> ${exit_code}\[\033[0m\]\n${PS1}"
    fi
}

export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/sbin:$HOME/.local/node_modules/.bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:.
export EDITOR=emacs
export NODE_PATH=$HOME/.local/lib/node_modules:/usr/lib/node_modules:$NODE_PATH
export MAKEOPTS="-j $(nproc)"
export PYTHONPYCACHEPREFIX=$HOME/.cache/python

if [[ $TERM == dumb && $INSIDE_EMACS ]]; then
    export TERM=dumb-emacs-ansi COLORTERM=1
fi

alias cat="bat --theme base16 --number"
alias head="cat -r :25"

alias j="jobs"
alias l="eza --all --long --sort time --no-permissions --no-user"
alias ll="eza --all --long --sort time"
alias ls="ls --color"
alias m="make"
alias p="pwd"
alias pl="plano"
alias py="python -q"
alias s="rg --hidden --fixed-strings --files-with-matches --count"
alias sm="rg --hidden --fixed-strings"

alias gd="git diff --minimal --ignore-space-at-eol"
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

function cdc {
    if [[ $1 ]]; then
        cd ~/code/$1
    else
        cd ~/code
    fi
}

alias mk="minikube"
alias sk="skupper"
alias skp="skupper --platform podman"

alias kc="kubectl"
alias kcl="echo kubectl logs; echo; kubectl logs --all-containers --all-pods"
alias kcs="echo kubectl get services; echo; kubectl get services"
alias kcd="echo kubectl get deployments; echo; kubectl get deployments"
alias kcp="echo kubectl get pods; echo; kubectl get pods"
alias kce="echo kubectl get events --sort-by=.lastTimestamp; echo; kubectl get events --sort-by=.lastTimestamp"

function kcn {
    if [[ $1 ]]; then
        kubectl config set-context --current --namespace "$1"
    fi

    kubectl config view --minify --output 'jsonpath={..namespace}'; echo
}

function kci {
    echo -n "Namespace: "
    kubectl config view --minify --output 'jsonpath={..namespace}'; echo; echo

    kubectl get services,deployments,pods
}

function kcsh {
    kubectl exec -it "$1" -- /bin/sh
}

function kctb {
    kubectl run kube-toolbox --image=qbituniverse/kube-toolbox
    kubectl exec -it kube-toolbox -- /bin/ash
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

bind '"\ep": previous-history' 2> /dev/null
bind '"\en": next-history' 2> /dev/null
