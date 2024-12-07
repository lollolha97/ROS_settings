#! /bin/bash

IMAGE_NAME="tiago"
sudo docker build -t ${IMAGE_NAME} .

echo "alias tiago='sudo docker run -it \
    -e DISPLAY=\$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    tiago'" >> ~/.bashrc

source ~/.bashrc