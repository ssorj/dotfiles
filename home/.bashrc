if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh

export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export EDITOR=emacs
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/sbin:$HOME/.local/node_modules/.bin:$PATH

if [[ $TERM == dumb && $INSIDE_EMACS ]]; then
    export TERM=dumb-emacs-ansi COLORTERM=1
fi

alias ls="ls --color"
alias l="ls -hltrF"
alias gs="git status --short --branch"
alias gd="git diff"
alias gl="git log -5"
alias gk="gitk --all"
alias docker="sudo docker"
alias bld="cmake .. -DCMAKE_INSTALL_PREFIX=~/.local && make -j8"

umask 002
