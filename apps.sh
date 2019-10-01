#!/usr/bin/env bash
RELEASE=$(lsb_release --release | cut -f2)

apt update

PACKAGES=(curl
	wget
	htop
	jq
	openvpn
	remmina
	git
    g++
	cmake
	gdb
	hexedit
	ranger
	tmux
	zsh
	clipit
	pulseicon
	volumeicon-alsa
	i3
	python3-dev
	python3-pip)

for package in ${PACKAGES[@]}; do
    echo "***********************"
    apt install -y $package
done

# install vim
add-apt-repository ppa:neovim-ppa/stable
apt update
apt install -y neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
rm ~/.config/init.vim.backup && mv ~/.config/init.vim ~/.config/init.vim.backup
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s -T ~/env/.config/nvim/init.vim ~/.config/init.vim
nvim +PluginInstall +qall

# install clang-7
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
SOURCE_LIST=/etc/apt/sources.list.d/clang.list
if [ $RELEASE = "16.04" ]; then
    echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main" >$SOURCE_LIST
    echo "deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main" >>$SOURCE_LIST
elif [ $RELEASE = "18.04" ]; then
    echo "deb http://apt.llvm.org/cosmic/ llvm-toolchain-bionic-8 main" >$SOURCE_LIST
    echo "deb-src http://apt.llvm.org/cosmic/ llvm-toolchain-bionic-8 main" >>$SOURCE_LIST
elif [ $RELEASE = "19.04" ]; then
    echo "deb http://apt.llvm.org/cosmic/ llvm-toolchain-disco-8 main" >$SOURCE_LIST
    echo "deb-src http://apt.llvm.org/cosmic/ llvm-toolchain-disco-8 main" >>$SOURCE_LIST
fi
apt update
apt install -y clang-7 lldb-7 lld-7 libfuzzer-7-dev libc++-7-dev libc++abi-7-dev



