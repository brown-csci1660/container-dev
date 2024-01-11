#!/bin/bash

set -eu

# set up default locale
export LANG=en_US.UTF-8

# set up libraries
apt-get -y install\
 libreadline-dev\
 locales\
 wamerican\
 libssl-dev

# set up default locale
locale-gen en_US.UTF-8
export LANG=en_US.UTF-8

# install programs used for system exploration
apt-get -y install\
 blktrace\
 linux-tools-generic\
 strace\
 tcpdump\
 htop\
 file\
 xxd

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
 traceroute\
 tshark

# remove unneeded .deb files
rm -r /var/lib/apt/lists/*

# set up passwordless sudo for user cs1660-user
useradd -m -s /bin/bash cs1660-user
echo "cs1660-user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/cs1660-init

rm -f /root/.bash_logout
rm -f /home/cs1660-user/.bash_logout
