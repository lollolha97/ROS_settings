# osrf에서 제공하는 ROS 2 Humble 베이스 이미지 사용
FROM osrf/ros:humble-desktop

# 환경 변수 설정
ENV DEBIAN_FRONTEND=noninteractive

# 패키지 업데이트 및 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    x11-apps \
    ros-humble-tiago-gazebo \
    && rm -rf /var/lib/apt/lists/*

# 사용자 권한과 X11 디스플레이 환경 설정
ENV DISPLAY=:0
ENV QT_X11_NO_MITSHM=1

# 기본 실행 명령어 (bash)
CMD ["bash"]