FROM ubuntu

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -yq \
    curl
    apt-utils \
    parallel \
    iputils-ping \
    net-tools \
    nano \
    nvim \
    git \
    pkg-config \
    cmake \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-system-dev \
    libboost-test-dev \
    libboost-thread-dev \
    libjpeg-dev \
    liblzma-dev \
    libpng12-dev

RUN git config --global user.name "Yukigaru"
RUN git config --global user.email "yukigaru@gmail.com"
