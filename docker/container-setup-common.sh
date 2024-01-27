#!/bin/bash

set -eu

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
target_user="${1:-cs1660-user}"

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
 nmap\
 telnet\
 time\
 pv\
 traceroute\
 tshark

# remove unneeded .deb files
rm -r /var/lib/apt/lists/*

# Set up the container user
if [[ $target_user == "cs1660-user" ]]; then
    useradd -m -s /bin/bash $target_user
else
    # If using the host's user, don't create one--podman will do this
    # automatically.  However, the default shell will be wrong, so set
    # a profile rule to update this
    chmod +x /etc/profile.d/20-fix-default-shell.sh # Copied in Podmanfile
fi

# set up passwordless sudo for user cs1660-user
echo "cs1660-user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/cs1660-init

rm -f /root/.bash_logout

mkdir -p /usr/local/etc
cat << EOF > /usr/local/etc/flag.txt
did you ever hear the tragedy of darth plagueis the wise? i thought
not. it's not a story the jedi would tell you. it's a sith
legend. darth plagueis was a dark lord of the sith, so powerful and so
wise he could use the force to influence the midichlorians to create
life... he had such a knowledge of the dark side that he could even keep
the ones he cared about from dying. the dark side of the force is a
pathway to many abilities some consider to be unnatural. he became so
powerful... the only thing he was afraid of was losing his power, which
eventually, of course, he did. unfortunately, he taught his apprentice
everything he knew, then his apprentice killed him in his
sleep. ironic. he could save others from death, but not himself.
EOF
