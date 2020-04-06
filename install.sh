#!/usr/bin/env bash
mkdir -p backups
touch ~/.localvars

mv ~/.bash_aliases ./backups/ || true
mv ~/.zshrc ./backups/ || true
mv ~/.gitconfig ./backups/ || true
mv ~/.profile ./backups/ || true
mv ~/.gdbinit ./backups/ || true
mv ~/.tmux.confg ./backups/ || true
mv ~/.config/i3/config ./backups/ || true
mv ~/.config/nvim/init.vim ./backups/ || true
mv ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ./backups/ || true
mv ~/.imwheelrc ./backups/ || true

ln -s -T ~/env/.bash_aliases ~/.bash_aliases
ln -s -T ~/env/.zshrc ~/.zshrc
ln -s -T ~/env/.gitconfig ~/.gitconfig
ln -s -T ~/env/.gdbinit ~/.gdbinit
ln -s -T ~/env/.tmux.conf ~/.tmux.conf

rm -f ~/.profile
ln -s -T ~/env/.profile ~/.profile

mkdir -p ~/.config/i3
ln -s -T ~/env/.config/i3/config ~/.config/i3/config

mkdir -p ~/.config/nvim
ln -s -T ~/env/.config/nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/mc
ln -s -T ~/env/.config/mc/mc.keymap ~/.config/mc/mc.keymap

mkdir -p ~/.config/sublime-text-3/Packages/User
ln -s -T ~/env/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

ln -s -T ~/env/.imwheelrc ~/.imwheelrc
