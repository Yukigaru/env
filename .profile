source .bash_aliases

# \n[\u@\h] \w:
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
GRAY="\[\033[00m\]"
PS1="\n${GREEN}[\u@\h] ${BLUE}\w${GRAY}: "
