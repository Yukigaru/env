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

# install neovim
add-apt-repository ppa:neovim-ppa/stable
apt update
apt install -y neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
rm ~/.config/init.vim.backup || true
mv ~/.config/init.vim ~/.config/init.vim.backup
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s -T ~/env/.config/nvim/init.vim ~/.config/init.vim
nvim +PluginInstall +qall



