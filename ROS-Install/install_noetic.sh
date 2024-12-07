#!/bin/bash
sudo apt update && sudo apt upgrade -y

# Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup keys
sudo apt install -y curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Install
sudo apt update && sudo apt install -y ros-noetic-desktop-full

# Setup ROS
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source "$HOME/.bashrc"

# Dependencies for building packages
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

# Initailize rosdep
sudo rosdep init
rosdep update

source "$HOME/.bashrc"