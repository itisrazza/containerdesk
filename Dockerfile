FROM debian:12

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes xfce4 xfce4-goodies tightvncserver dbus-x11

COPY start.sh /root/.start.sh

EXPOSE 5901
ENV USER=root

ENTRYPOINT [ "/root/.start.sh" ]
