FROM ubuntu:jammy

LABEL org.opencontainers.image.source=https://github.com/brown-csci1660/container-dev

# set environment variables for tzdata
ARG TZ=America/New_York
ENV TZ=${TZ}

# include manual pages and documentation
ARG DEBIAN_FRONTEND=noninteractive
ENV LANG en_US.UTF-8

COPY setup-amd64.sh /usr/local/bin/container-setup
COPY .image-version /etc/image-version

RUN /usr/local/bin/container-setup

# git build arguments
ARG USER=cs1660\ User
ARG EMAIL=nobody@example.com

# configure your environment
USER cs1660-user
RUN rm -f ~/.bash_logout

WORKDIR /home/cs1660
CMD ["/bin/bash", "-l"]
