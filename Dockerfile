FROM vcxpz/baseimage-alpine:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="qBittorrent version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment settings
ENV HOME="/config" \
	XDG_CONFIG_HOME="/config" \
	XDG_DATA_HOME="/config"

RUN set -xe && \
	echo "**** install runtime packages ****" && \
	apk add --no-cache \
		jq && \
	echo "**** install qbittorrent ****" && \
	if [ -z ${VERSION} ]; then \
		VERSION=$(curl -sL "http://dl-cdn.alpinelinux.org/alpine/edge/community/x86_64/APKINDEX.tar.gz" | tar -xz -C /tmp && \
			awk '/^P:qbittorrent-nox$/,/V:/' /tmp/APKINDEX | sed -n 2p | sed 's/^V://'); \
	fi && \
	apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/v3.15/main/ \
		qbittorrent-nox=="${VERSION}" && \
	echo "**** cleanup ****" && \
	rm -rf \
		/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 6881 6881/udp 8080
VOLUME /config
