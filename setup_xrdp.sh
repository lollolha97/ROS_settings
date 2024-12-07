#!/bin/bash

# 관리자 권한 설정
sudo usermod -aG sudo "$USER"

# 기본 애플리케이션 설치 및 apt 미러 수정 (기본 미러 사용)
sudo sed -i 's/mirror.kakao.com/archive.ubuntu.com/g' /etc/apt/sources.list
sudo sed -i 's/ftp.lanet.kr/ports.ubuntu.com/g' /etc/apt/sources.list

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y vim git wget curl tmux net-tools openssh-server x11-apps open-vm-tools open-vm-tools-desktop
sudo apt-get install -y fonts-nanum fonts-nanum-coding fonts-nanum-extra

# # SSH 설정 (Root 로그인 비활성화)
# sudo ssh-keygen -A
# sudo mkdir -p /var/run/sshd
# sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
# sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
# sudo service sshd restart

# XRDP 및 XFCE4 설치 (Windows Remote 환경 구성)
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y xrdp xfce4 xfce4-session terminator
sudo systemctl enable xrdp
sudo adduser xrdp ssl-cert
echo startxfce4 > ~/.xsession
sudo chmod +x ~/.xsession
sudo sed -i 's/exec \/bin\/sh \/etc\/X11\/Xsession//g' /etc/xrdp/startwm.sh
sudo -- sh -c "echo unset DBUS_SESSION_BUS_ADDRESS >> /etc/xrdp/startwm.sh"
sudo -- sh -c "echo unset XDG_RUNTIME_DIR >> /etc/xrdp/startwm.sh"
sudo -- sh -c "echo . \$HOME/.profile >> /etc/xrdp/startwm.sh"
sudo -- sh -c "echo startxfce4 >> /etc/xrdp/startwm.sh"
sudo systemctl restart xrdp

# 기본 앱 설치
sudo apt-get install -y firefox code

# 시스템 정리 및 재부팅
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
sudo reboot