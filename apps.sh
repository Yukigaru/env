#!/usr/bin/env bash
RELEASE=$(lsb_release --release | cut -f2)

apt update

PACKAGES=(curl
    wget
    htop
    openvpn
    remmina
    git
    g++
    cmake
    gdb
    tmux
    zsh
    clipit
    i3
    xclip
    xscreensaver
    python3-dev
    python3-pip)

for package in ${PACKAGES[@]}; do
    echo "***********************"
    apt install -y $package
done



