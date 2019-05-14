### ENV
- VNC_PASSWORD - vnc password
- SSH_PASSWORD - ssh password

### Run Container
```bash
docker run -d -p 20222:22 \
              -p 5901:5901 \
              -e VNC_PASSWORD=${your_password} \
              -e SSH_PASSWORD=${your_password} \
              --rm \
              --name xfce4 \
              fkatkit/xfce4-desktop
```