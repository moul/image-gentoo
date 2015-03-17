DOCKER_NAMESPACE =	armbuild/
NAME =			ocs-distrib-gentoo
VERSION =		latest
VERSION_ALIASES =	stage3
TITLE =			Gentoo
DESCRIPTION =		Gentoo
SOURCE_URL =		https://github.com/online-labs/image-gentoo


## Image tools  (https://github.com/online-labs/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/image-tools | bash
-include docker-rules.mk
## Below you can add custom makefile commands and overrides
