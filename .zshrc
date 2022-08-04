HISTFILE=~/.histfile
HISTSIZE=60000
SAVEHIST=60000

setopt notify
setopt autocd
setopt extendedglob
setopt globdots # add .dot files to completion
#setopt rmstarsilent # do not ask for comfirmation to rm *

setopt HIST_IGNORE_DUPS # Ignore duplicate lines in History

bindkey -e

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/yukigaru/.zshrc'

autoload -Uz compinit
compinit

bindkey "^[[1;5D" backward-word # Ctrl+Left
bindkey "^[[1;5C" forward-word # Ctrl+Right

setopt menucomplete
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# PROMPT SETUP
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

PROMPT=$'\n''%{$fg[blue]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%} %d> '
#RPROMPT=\$vcs_info_msg_0_

# ALIASES
mkdir-cd() {
    if [ -z "$1" ]; then
        echo 'Wrong arguments'
        return 1
    fi
    mkdir -p $1
    cd $1
}

cd-ls() {
    cd $1 && ls -al --color=auto
}

alias ls="exa"
alias c="cd-ls"
alias mkcd="mkdir-cd"
alias g="git"
alias vim="nvim"
alias v="nvim"
alias ll="ls -al --color=auto"
alias l="ll"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias r="ranger"
alias setclip="xclip -selection c" # using: echo "abc" | setclip
alias open="xdg-open"
alias sc="systemctl"
alias jc="journalctl"
alias sudo='sudo ' # so that all aliases above also expanded via `sudo cmd`
alias la='find -printf "%TY-%Tm-%Td %TT %p\n" | sort --numeric-sort --reverse | head -20' # top N last modified files, sorted
alias gs='g s'
alias gd='g d'
alias gl='g l'
alias ga='g a'
alias gc='g c'

echo "Remember aliases:"
echo "jc - journalctl, sc - systemctl, c - cd, v - vim, mkcd, r - ranger"
echo "F2 - jump to a parent dir, Alt+D - delete until end of the line"
echo "g au - git add -u, g sta - git stash apply, g ds - diff --staged"
echo "la - top N last modified files, sorted"
echo "i3: mod+shift+S - screenshot with flameshot"

# Alt+Backspace
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# Alt+Left
backward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-word
}
zle -N backward-word-dir
bindkey "^[[1;3C" forward-word-dir

# Alt+Right
forward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle forward-word
}
zle -N forward-word-dir
bindkey "^[[1;3D" backward-word-dir

# F2 - cd to the parent directory
cdparent() { cd .. ; pwd ; zle reset-prompt }
zle -N cdparent
bindkey "^[OQ" cdparent # F2


#
export PATH=~/.local/bin:${PATH}

source ~/.localvars
