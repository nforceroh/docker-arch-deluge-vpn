FROM nforceroh/docker-arch-base

MAINTAINER Sylvain Martin (sylvain@nforcer.com)

ENV UMASK=000
ENV PUID=3001
ENV PGID=3000
# logging levels none, critical, error, warning, info, info
ENV DELUGE_LOGGING=info
ENV DELUGE_MOVE_COMPLETED=/data/done
ENV DELUGE_TORRENT_LOCATION=/data/torrents
ENV DELUGE_DOWNLOAD_WORK=/data/work
ENV DELUGE_AUTOADD_LOCATION=/data/incoming
ENV DELUGE_LISTEN_PORT=8080,8080

RUN \
  echo "Installing openvpn and deluge" \
  && pacman --noconfirm -Syu \
  && pacman --noconfirm -S kmod openvpn deluge bind-tools python2-service-identity python2-mako


VOLUME /config

VOLUME /data

EXPOSE 8112

COPY rootfs/ /
