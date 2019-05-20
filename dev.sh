#!/usr/bin/env bash
docker build -t fkatkit/xfce4-desktop:latest .
docker run -d -p 20222:22 -p 5901:5901 --rm --name xfce4 fkatkit/xfce4-desktop
# docker exec -it xfce4 /bin/bash


docker run -d -p 20222:22 \
              -p 5901:5901 \
              -e VNC_PASSWORD=password \
              -e SSH_PASSWORD=password \
              --rm \
              --name xfce4 \
              fkatkit/xfce4-desktop