#!/usr/bin/env bash

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

PACKAGES=(
    curl
    wget
    htop
    git
    cmake
    tmux
    zsh
    fzf
    jq
    neovim
    the_silver_searcher   # ag (silversearcher-ag equivalent)
    python3
    zsh-autosuggestions
)

for package in "${PACKAGES[@]}"; do
    echo "***********************"
    brew install "$package"
done
