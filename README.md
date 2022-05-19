## docker-qbittorrent

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/r/vcxpz/qbittorrent) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/qbittorrent?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-qbittorrent/actions?query=workflow%3A"Auto+Builder+CI")

**This is an unofficial image that has been modified for my own needs. If my needs match your needs, feel free to use this image at your own risk.**

Fork of [linuxserver/docker-qbittorrent](https://github.com/linuxserver/docker-qbittorrent) (Equivalent to 4.4.2-r5-ls193)

[qBittorrent](https://www.qbittorrent.org/) is a bittorrent client programmed in C++ / Qt that uses libtorrent (sometimes called libtorrent-rasterbar) by Arvid Norberg.

It aims to be a good alternative to all other bittorrent clients out there. qBittorrent is fast, stable and provides unicode support as well as many features.

## Usage

```bash
docker run -d \
  --name=qbittorrent \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Australia/Melbourne \
  -v <path to appdata>:/config \
  -v <path to downloads>:/downloads \
  --restart unless-stopped \
  vcxpz/qbittorrent
```

[![template](https://img.shields.io/badge/unraid_template-ff8c2f?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-templates/blob/main/hydaz/qbittorrent.xml)

## Upgrading qBittorrent

To upgrade, all you have to do is pull the latest Docker image. We automatically check for qBittorrent updates daily. When a new version is released, we build and publish an image both as a version tag and on `:latest`.

## Fixing Appdata Permissions

If you ever accidentally screw up the permissions on the appdata folder, run `fix-perms` within the container. This will restore most of the files/folders with the correct permissions.
