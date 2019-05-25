RELEASE=$(lsb_release --release | cut -f2)

apt update
apt install -y curl htop jq
apt install -y openvpn remmina
apt install -y git cmake
apt install -y gdb
apt install -y ranger zsh
apt install -y docker.io
apt install -y clipit
apt install -y pulseaudio volumeicon-alsa
apt install -y i3

# install vim
apt install -y neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
ln -s -T ~/env/.config/nvim/init.vim ~/.config/init.vim
vim +PlugInstall +qall

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



