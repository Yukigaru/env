#!/usr/bin/env bash
BACKUP_DIR="./backup `date +"%Y-%m-%d %H-%M-%S"`"
mkdir -p "${BACKUP_DIR}"
touch ~/.localvars

mv ~/.bash_aliases ${BACKUP_DIR} 2>/dev/null || true
ln -f -s -T ~/env/.bash_aliases ~/.bash_aliases

mv ~/.zshrc ${BACKUP_DIR} 2>/dev/null || true
ln -f -s -T ~/env/.zshrc ~/.zshrc

mv ~/.gitconfig ${BACKUP_DIR} 2>/dev/null || true
ln -f -s -T ~/env/.gitconfig ~/.gitconfig

mv ~/.gdbinit ${BACKUP_DIR} 2>/dev/null || true
ln -f -s -T ~/env/.gdbinit ~/.gdbinit

mv ~/.tmux.confg ${BACKUP_DIR} 2>/dev/null || true
ln -f -s -T ~/env/.tmux.conf ~/.tmux.conf

mv ~/.profile ${BACKUP_DIR} 2>/dev/null || true
ln -f -s -T ~/env/.profile ~/.profile

mkdir -p ~/.config/i3
mv ~/.config/i3/config ${BACKUP_DIR} 2>/dev/null || true
ln -f -s -T ~/env/.config/i3/config ~/.config/i3/config

mkdir -p ~/.config/nvim
mv ~/.config/nvim/init.vim ${BACKUP_DIR} 2>/dev/null || true
ln -f -s -T ~/env/.config/nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/sublime-text-3/Packages/User
mv ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ${BACKUP_DIR} 2>/dev/null || true
ln -f -s -T ~/env/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
