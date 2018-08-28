alias lsl="ls -al"

#
mkdir-cd() {
    mkdir -p $1
    cd $1
}
alias mkcd="mkdir-cd"

#
find() {
    sudo find . -name $1
}

gfind() {
    sudo find / -name $1
}

#
git-fast-push() {
    git add .
    git commit -m "$1"
    git push
}
alias gitfp="git-fast-push"

alias gitst="git status"

alias glog="git log -50 --oneline --graph"
