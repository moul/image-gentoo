## -*- docker-image-name: "armbuild/ocs-distrib-gentoo:latest" -*-
FROM armbuild/gentoo:stage3
MAINTAINER Online Labs <opensource@ocs.online.net> (@online_en)


# Environment
ENV OCS_BASE_IMAGE armbuild/ocs-gentoo:latest


# Patch rootfs for docker-based builds
RUN emerge -v net-misc/curl \
 && curl -Lq http://j.mp/ocs-scripts | FLAVORS=common,docker-based bash -e \
 && /usr/local/sbin/builder-enter


# Add patches
# ADD ./patches/ /


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
