#!/bin/bash

set -eu

export DEBIAN_FRONTEND=noninteractive

apt-get update &&\
  yes | unminimize


# install GCC-related packages
apt-get update && apt-get -y install\
 build-essential\
 binutils-doc\
 cpp-doc\
 gcc-doc\
 g++\
 g++-multilib\
 gdb\
 gdb-doc\
 glibc-doc\
 libblas-dev\
 liblapack-dev\
 liblapack-doc\
 libstdc++-11-doc\
 make\
 make-doc\
 locales

# set up default locale
locale-gen en_US.UTF-8
export LANG=en_US.UTF-8

# install programs used for system exploration
apt-get -y install\
 blktrace\
 linux-tools-generic\
 strace\
 tcpdump\
 htop

apt-get install -y python3 \
	python3-pip \
	python3-dev \
	python3-setuptools \
	python3-venv

# install interactive programs (emacs, vim, nano, man, sudo, etc.)
apt-get -y install\
 bc\
 curl\
 dc\
 git\
 git-doc\
 man\
 micro\
 nano\
 psmisc\
 sudo\
 wget\
 screen\
 tmux\
 emacs-nox\
 vim 

# Install golang
bash -c "mkdir /usr/local/go && wget -O - https://go.dev/dl/go1.19.5.linux-amd64.tar.gz | sudo tar -xvz -C /usr/local"

# set up libraries
apt-get -y install\
 libreadline-dev\
 locales\
 wamerican\
 libssl-dev

# install programs used for networking
apt-get -y install\
 dnsutils\
 inetutils-ping\
 iproute2\
 net-tools\
 netcat\
 telnet\
 time\
 pv\
 traceroute

# set up default locale
locale-gen en_US.UTF-8
export LANG=en_US.UTF-8

# set up passwordless sudo for user cs1660-user
useradd -m -s /bin/bash cs1660-user
echo "cs1660-user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/cs1660-init

# create binary reporting version of dockerfile
(echo '#\!/bin/sh'; echo 'echo 1') > /usr/bin/cs1660-docker-version
chmod ugo+rx,u+w,go-w /usr/bin/cs1660-docker-version
