FROM ubuntu:noble

LABEL org.opencontainers.image.source=https://github.com/brown-csci1660/container-dev

# set environment variables for tzdata
ARG TZ=America/New_York
ENV TZ=${TZ}

# include manual pages and documentation
ARG DEBIAN_FRONTEND=noninteractive
ENV LANG en_US.UTF-8

COPY container-setup-amd64.sh /usr/local/bin/container-setup-amd64
COPY container-setup-common.sh /usr/local/bin/container-setup-common
COPY entrypoint.sh /usr/local/bin/container-entrypoint
COPY .image-version /etc/image-version

RUN /usr/local/bin/container-setup-amd64

# git build arguments
ARG USER=cs1660\ User
ARG EMAIL=nobody@example.com

# configure your environment
USER cs1660-user

ENTRYPOINT ["container-entrypoint"]

WORKDIR /home/cs1660
CMD ["/bin/bash", "-l"]
