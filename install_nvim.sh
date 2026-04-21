#!/usr/bin/env bash
set -eu -o pipefail

if [ "$EUID" -eq 0 ]; then
    echo "Please run as a user, not super-user"
    exit 1
fi

# Install neovim
if [ -f "/etc/arch-release" ]; then
    sudo pacman -Syy && sudo pacman -S --noconfirm neovim
elif [ -f "/etc/lsb-release" ] || [ -f "/etc/debian_version" ]; then
    sudo apt-get update && sudo apt-get install -y neovim
fi

# Vundle
mkdir -p ~/.vim/bundle
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Link config
mkdir -p ~/.config/nvim
[ ! -f ~/.config/nvim/init.vim ] && ln -sf ~/env/.config/nvim/init.vim ~/.config/nvim/init.vim

echo "Installing plugins (first run errors are expected — colorscheme/airline don't exist yet)"
nvim --headless +PluginInstall +qall 2>/dev/null || true

# Sanity: at least one plugin should now be present.
ls ~/.vim/bundle/ | grep -qv '^Vundle.vim$' || { echo "Plugin install failed"; exit 1; }
echo "OK — plugins installed:"
ls ~/.vim/bundle/
