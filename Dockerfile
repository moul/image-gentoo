## -*- docker-image-name: "armbuild/scw-distrib-gentoo:latest" -*-
FROM armbuild/gentoo:stage3
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Environment
ENV SCW_BASE_IMAGE armbuild/scw-gentoo:latest


# Patch rootfs for docker-based builds
RUN emerge -v net-misc/curl \
 && curl -Lq http://j.mp/scw-skeleton | FLAVORS=common,docker-based,openrc bash -e \
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
ADD ./patches/usr /usr


# Set default locale to en_US.UTF-8
RUN locale-gen \
 && eselect locale set en_US.utf8


# Enable services
RUN true \
 && rc-update add disconnect-extra-volumes shutdown \
 && rc-update add initramfs-shutdown shutdown \
 && rc-update add nbd-root-disconnect shutdown \
 && rc-update add ntpd default \
 && rc-update add set-confd-hostname boot \
 && rc-update add ssh-keys default \
 && rc-update add sshd default \
 && rc-update add sync-connect-extra-volumes boot \
 && rc-update add sync-kernel-extra sysinit \
 && rc-update add syslog-ng default \
 && rc-status


# Disable uneeded services
RUN rc-update del keymaps boot


# Create /var/lib/misc, required by service 'random' at stop
RUN mkdir -p /var/lib/misc


RUN rm -rf /var/tmp/portage/* /usr/portage/distfiles/*


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
