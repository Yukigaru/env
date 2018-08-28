sudo apt-get update
sudo apt install -y \
    iputils-ping \
    net-tools \
    curl \
    cmake \
    pkg-config \
    doxygen \
    graphviz \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-system-dev \
    libboost-test-dev \
    libboost-thread-dev \
    libgtest-dev \
    libjpeg-dev \
    liblzma-dev \
    libpng12-dev

echo '=> bash_aliases'
cp .bash_aliases ~/.bash_aliases
source ~/.bash_aliases
