#!/bin/bash

# src 폴더 생성
mkdir -p "$HOME/catkin_ws/src/"

# Alias 등록
echo "alias cs='cd ~/catkin_ws/src'" >> "$HOME/.bashrc"
echo "alias cm='cd ~/catkin_ws/ && catkin_make'" >> "$HOME/.bashrc"
echo "alias sb='source ~/.bashrc'" >> "$HOME/.bashrc"

# catkin_ws 디렉토리로 이동
cd "$HOME/catkin_ws/"

# Catkin 워크스페이스 초기화 및 빌드
catkin init
catkin_make

source "$HOME/.bashrc"