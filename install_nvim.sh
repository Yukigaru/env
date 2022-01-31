#!/usr/bin/env bash
set -x
set -eu -o pipefail

if [ "$EUID" -eq 0 ]; then
    echo "Please run as a user, not super-user"
    exit
fi

if [ -f "/etc/arch-release" ]; then
    sudo pacman -Syy && sudo pacman -S --noconfirm neovim
elif [ -f "/etc/lsb-release" ]; then
    sudo add-apt-repository -y ppa:neovim-ppa/stable
    sudo apt update && sudo apt install -y neovim
fi

# install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim

if [ -f "~/.config/init.vim/backup" ]; then
    rm ~/.config/init.vim.backup || true
fi
if [ -f "~/.config/init.vim" ]; then
    mv ~/.config/init.vim ~/.config/init.vim.backup
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s -T ~/env/.config/nvim/init.vim ~/.config/init.vim

USER=$(whoami)
sudo chown $USER:$USER -R ~/.local/share/nvim

echo "Installing plugins"
nvim +PluginInstall +qall



