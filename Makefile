DOCKER_NAMESPACE =	armbuild/
NAME =			scw-distrib-gentoo
VERSION =		latest
VERSION_ALIASES =	stage3
TITLE =			Gentoo
DESCRIPTION =		Gentoo
SOURCE_URL =		https://github.com/scaleway/image-gentoo


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
## Below you can add custom makefile commands and overrides
