#!/usr/bin/env bash

# test

echo ${VNC_PASSWORD} | vncpasswd -f > /root/.vnc/passwd
echo "root:${SSH_PASSWORD}" | chpasswd

vncserver :1 -geometry 1360x768 -depth 24

/usr/sbin/sshd -D
