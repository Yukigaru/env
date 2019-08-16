# mkdir & cd
mkdir-cd() {
    if [ -z "$1" ]; then
        echo 'Wrong arguments'
        return 1
    fi
    mkdir -p $1
    cd $1
}
alias mkcd="mkdir-cd"

# local shortened find
lfind() {
    if [ -z "$1" ]; then
        echo 'Wrong arguments'
        return 1
    fi
    sudo find . -name $1
}

# global shortened find
gfind() {
    if [ -z "$1" ]; then
        echo 'Wrong arguments'
        return 1
    fi
    sudo find / -name $1
}

#
alias grep="grep -i"

#
git-fast-push() {
    git add .
    git commit -m "$1"
    git push
}
alias gitfp="git-fast-push"
alias gitst="git status"
alias glog="git log -25 --oneline --graph"
alias ll="ls -al"
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias g="git"
