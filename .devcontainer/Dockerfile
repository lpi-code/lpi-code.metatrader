FROM mcr.microsoft.com/devcontainers/base:bullseye

RUN apt update && \
  apt-get install -y \
  ansible \
  qemu \
  vagrant \
  ebtables \
  dnsmasq \
  libvirt-daemon-system \
  libvirt-clients \
  libvirt-dev \
  pkg-config \
  python3-pip && \
  vagrant plugin install vagrant-libvirt && \
  pip3 install --user python-vagrant && \
  pip3 install --user testinfra && \
  pip3 install --user libvirt-python && \
  pip3 install --user molecule && \
  pip3 install --user molecule-vagrant && \
  pip3 install --user rich
