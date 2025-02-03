FROM mcr.microsoft.com/devcontainers/base:bullseye

RUN apt update && apt install -y vagrant && vagrant plugin install vagrant-libvirt

COPY dev-requirements.txt /tmp/dev-requirements.txt
RUN pip install -r /tmp/dev-requirements.txt && rm /tmp/dev-requirements.txt