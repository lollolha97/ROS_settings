#!/bin/bash

# sudo 캐시 활성화
sudo -v

# UTF-8 로케일 설정 확인 및 설정
echo "로케일 설정을 확인 중입니다..."
locale  # UTF-8 확인
sudo apt update && sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # 설정 확인

# 필수 도구 설치
echo "software-properties-common 설치 및 universe 저장소 추가..."
sudo apt install -y software-properties-common
sudo add-apt-repository universe

# 시스템 업데이트 및 curl 설치
echo "시스템 업데이트 및 curl 설치 중..."
sudo apt update && sudo apt install -y curl

# ROS 2 저장소 키 추가
echo "ROS 2 저장소 키 추가 중..."
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# ROS 2 저장소를 소스 목록에 추가
echo "ROS 2 저장소를 소스 목록에 추가 중..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# 시스템 업데이트 및 업그레이드
echo "시스템 업데이트 및 업그레이드 중..."
sudo apt update
sudo apt upgrade -y

# ROS 2 Humble Desktop 설치
echo "ROS 2 Humble Desktop 설치 중..."
sudo apt install -y ros-humble-desktop

# 새로운 셸에서 자동으로 ROS 2 설정이 적용되도록 bashrc에 추가
echo "환경을 설정하여 새로운 셸에서 ROS 2가 자동으로 적용되도록 구성 중..."
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "ROS 2 설치 및 설정 완료. 새로운 터미널을 열거나 'source ~/.bashrc' 명령어를 실행하여 ROS 2를 사용할 수 있습니다."