#!/usr/bin/env bash
ln -s -T ~/env/.bash_aliases ~/.bash_aliases
ln -s -T ~/env/.zshrc ~/.zshrc
ln -s -T ~/env/.gitconfig ~/.gitconfig
ln -s -T ~/env/.gdbinit ~/.gdbinit

rm -f ~/.profile
ln -s -T ~/env/.profile ~/.profile

mkdir -p ~/.config/i3
ln -s -T ~/env/.config/i3/config ~/.config/i3/config

mkdir -p ~/.config/nvim
ln -s -T ~/env/.config/nvim/init.vim ~/.config/nvim/init.vim
