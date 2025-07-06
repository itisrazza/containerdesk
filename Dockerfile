FROM debian:12-slim

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tightvncserver
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends icewm xfonts-base
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends xterm x11-apps

# install busybox
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends busybox
RUN busybox --install

# rip out stuff we don't need
RUN apt-get clean

# replace icewm assets with only what we need
RUN rm -rf /usr/share/icewm
COPY icewm /usr/share/icewm

# copy the home folder
COPY --chown=root:root home /root

# container startup
EXPOSE 5900
ENTRYPOINT [ "/root/.start.sh" ]
