FROM nforceroh/docker-arch-base

MAINTAINER Sylvain Martin (sylvain@nforcer.com)

RUN \
  echo "Installing openvpn and deluge" \
  && pacman --noconfirm -Syu \
  && pacman --noconfirm -S kmod openvpn deluge bind-tools python2-service-identity python2-mako

COPY rootfs/ /
