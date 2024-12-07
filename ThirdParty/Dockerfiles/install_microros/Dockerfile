FROM ros:humble

# 환경 변수 설정
ENV ROS_DISTRO=humble

# apt-utils 포함하여 필수 패키지 설치
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-utils \
    git \
    python3-pip \
    python3-colcon-common-extensions \
    python3-rosdep && \
    rm -rf /var/lib/apt/lists/*

# ROS 환경 초기화 (기존 파일 제거 후 초기화)
RUN rm -f /etc/ros/rosdep/sources.list.d/20-default.list && \
    rosdep init && rosdep update

# micro-ROS 작업공간 생성 및 소스 코드 다운로드
WORKDIR /microros_ws
RUN git clone -b $ROS_DISTRO https://github.com/micro-ROS/micro_ros_setup.git src/micro_ros_setup

# 의존성 설치
RUN apt-get update && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -y && \
    rm -rf /var/lib/apt/lists/*

# 빌드
RUN /bin/bash -c "source /opt/ros/$ROS_DISTRO/setup.bash && colcon build"
