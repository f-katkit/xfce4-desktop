FROM ubuntu:xenial

ENV LC_CTYPE UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV DISPLAY localhost:0.0
ENV USER root

ENV SSH_PASSWORD input_your_password
ENV VNC_PASSWORD input_your_vnc_password

RUN apt-get update \
      && apt-get install -y -qq \
        openssh-server \
        locales \
        xfce4 \
        tightvncserver \
        language-pack-ja \
        fonts-vlgothic \
      && mkdir /var/run/sshd \
      && echo "root:${SSH_PASSWORD}" | chpasswd \
      && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
      && locale-gen en_US.UTF-8 \
      && mkdir -m 700 /root/.vnc \
      && echo '#!/bin/bash' > /root/.vnc/xstartup \
      && echo 'xrdb $HOME/.Xresources' >> /root/.vnc/xstartup \
      && echo 'startxfce4 &' >> /root/.vnc/xstartup \
      && echo ${VNC_PASSWORD} | vncpasswd -f > /root/.vnc/passwd \
      && chmod 600 /root/.vnc/passwd \
      && chmod 755 /root/.vnc/xstartup \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22
EXPOSE 5901

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT /bin/sh /root/entrypoint.sh