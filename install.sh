#!/usr/bin/env bash
BACKUP_DIR="./backup `date +"%Y-%m-%d %H-%M-%S"`"
mkdir -p "${BACKUP_DIR}"
touch ~/.localvars

mv ~/.bash_aliases ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.bash_aliases ~/.bash_aliases

mv ~/.zshrc ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.zshrc ~/.zshrc

mv ~/.gitconfig ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.gitconfig ~/.gitconfig

mv ~/.gitconfig-work ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.gitconfig-work ~/.gitconfig-work

mv ~/.gdbinit ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.gdbinit ~/.gdbinit

mv ~/.tmux.conf ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.tmux.conf ~/.tmux.conf

mv ~/.profile ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.profile ~/.profile

mv ~/.fzfignore ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.fzfignore ~/.fzfignore

mkdir -p ~/.local/bin
mv ~/.local/bin/fzf-source ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/bin/fzf-source ~/.local/bin/fzf-source

mkdir -p ~/.config/htop
mv ~/.config/htop/htoprc ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.config/htoprc ~/.config/htop/htoprc

mkdir -p ~/.config/i3
mv ~/.config/i3/config ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.config/i3/config ~/.config/i3/config

mkdir -p ~/.config/nvim
mv ~/.config/nvim/init.vim ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.config/nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/sublime-text-3/Packages/User
mv ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

mkdir -p ~/.config/ranger
mv ~/.config/i3/config ${BACKUP_DIR} 2>/dev/null || true
ln -f -s ~/env/.config/ranger/rc.conf ~/.config/ranger/rc.conf
