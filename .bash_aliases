alias ls="ls -l"

git-fast-push() {
    git add .
    git commit -m "$1"
    git push
}
alias gitfp="git-fast-push"

alias gitst="git status"

