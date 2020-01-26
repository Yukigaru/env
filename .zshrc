HISTFILE=~/.histfile
HISTSIZE=60000
SAVEHIST=60000

setopt notify
setopt autocd
setopt extendedglob
setopt globdots # add .dot files to completion

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
RPROMPT=\$vcs_info_msg_0_

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
    cd $1
    ls -al --color=auto
}

alias c="cd-ls"
alias mkcd="mkdir-cd"
alias r='ranger --choosedir=$HOME/.cache/.rangerdir; LASTDIR=`cat $HOME/.cache/.rangerdir`; cd "$LASTDIR"'
alias g="git"
alias vim="nvim"
alias v="nvim"
alias ll="ls -al --color=auto"
alias l=ll
alias setclip="xclip -selection c" # using: echo "abc" | setclip
alias tailf="tail -f"
