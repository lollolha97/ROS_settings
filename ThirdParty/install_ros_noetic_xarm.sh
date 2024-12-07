#!/bin/bash

# src 디렉토리로 이동 후 xarm_ros 리포지토리 클론
cd "$HOME/catkin_ws/src" || exit
git clone https://github.com/xArm-Developer/xarm_ros.git --recursive

# xarm_ros 디렉토리로 이동 후 서브모듈 업데이트
cd "$HOME/catkin_ws/src/xarm_ros" || exit
git pull
git submodule sync
git submodule update --init --remote

# rosdep 업데이트 및 필요한 의존성 설치
rosdep update
rosdep check --from-paths . --ignore-src --rosdistro noetic
rosdep install --from-paths . --ignore-src --rosdistro noetic -y

# Catkin 워크스페이스로 이동 후 빌드
cd "$HOME/catkin_ws/" || exit
catkin_make

# ROS 환경 변수 설정 파일을 로드
source "$HOME/.bashrc"