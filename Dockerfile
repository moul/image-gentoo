## -*- docker-image-name: "armbuild/ocs-distrib-gentoo:latest" -*-
FROM armbuild/gentoo:stage3
MAINTAINER Online Labs <opensource@ocs.online.net> (@online_en)


# Environment
ENV OCS_BASE_IMAGE armbuild/ocs-gentoo:latest


# Patch rootfs for docker-based builds
RUN emerge -v net-misc/curl \
 && curl -Lq http://j.mp/ocs-scripts | FLAVORS=common,docker-based bash -e \
 && /usr/local/sbin/builder-enter


# Install packages
RUN emerge -v \
    app-admin/logrotate \
    app-admin/syslog-ng \
    net-firewall/iptables \
    net-misc/dhcpcd \
    net-misc/ntp \
    sys-apps/iproute2 \
    sys-auth/nss-myhostname \
    sys-block/nbd


# Add patches
ADD ./patches/etc /etc


# Set default locale to en_US.UTF-8
RUN locale-gen \
 && eselect locale set en_US.utf8


# Enable services
RUN rc-update add ssh-keys && \
  rc-update add sshd default && \
  rc-update add ntpd default


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
