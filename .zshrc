HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt notify
setopt autocd
setopt extendedglob

bindkey -e

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/yukigaru/.zshrc'

autoload -Uz compinit
compinit

setopt menucomplete
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

PROMPT='[%n@%m] %d> '

# Aliases
git-fast-push() {
    git add .
    git commit -m "$1"
    git push
}
alias gitfp="git-fast-push"
alias gitst="git status"
alias glog="git log -50 --oneline --graph"

alias ll="ls -al"

mkdir-cd() {
    if [ -z "$1" ]; then
        echo 'Wrong arguments'
        return 1
    fi
    mkdir -p $1
    cd $1
}
alias mkcd="mkdir-cd"
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
