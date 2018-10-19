Gentoo image on Scaleway [![Build Status](https://travis-ci.org/scaleway/image-gentoo.svg?branch=master)](https://travis-ci.org/scaleway/image-gentoo)
====================================

[![Run on Scaleway](http://scaleway.github.io/image-tools/assets/run.svg)](https://cloud.scaleway.com/#/servers/new?image=da0217bb-5c89-4570-8147-faa01143c1d0)

Scripts to build the official Gentoo image on Scaleway

This image is built using [Image Tools](https://github.com/scaleway/image-tools) and depends on the [armbuild/gentoo](https://registry.hub.docker.com/u/armbuild/gentoo/) Docker image.

<img src="http://upload.wikimedia.org/wikipedia/fr/3/32/Gentoo-logo.png" width="146px" />

---

**This image is meant to be used on a C1 server.**

We use the Docker's building system and convert it at the end to a disk image that will boot on real servers without Docker. Note that the image is still runnable as a Docker container for debug or for inheritance.

[More info](https://github.com/scaleway/image-tools#docker-based-builder)

---

Install
-------

Build and write the image to /dev/nbd1 (see [documentation](https://www.scaleway.com/docs/create_an_image_with_docker))

    $ make install

Full list of commands available at: [scaleway/image-tools](https://github.com/scaleway/image-tools/#commands)


---

Links
-----

- [Gentoo project](http://www.gentoo.org)
- [ARM support on Gentoo](http://wiki.gentoo.org/wiki/Project:ARM)

---

A project by [![Scaleway](https://avatars1.githubusercontent.com/u/5185491?v=3&s=42)](https://www.scaleway.com/) [![GuardRails badge](https://badges.production.guardrails.io/moul/image-gentoo.svg)](https://www.guardrails.io)

