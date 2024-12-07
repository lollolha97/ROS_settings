# sudo usermod -aG sudo sang
# sudo -- sh -c "echo "sang" | sudo -S chmod 777 /home"
# sudo -- sh -c "echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"

# Install apps
# sudo sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
# sudo sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
# sudo sed -i 's/ports.ubuntu.com/ftp.lanet.kr/g' /etc/apt/sources.list

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install vim git wget curl tmux net-tools openssh-server x11-apps open-vm-tools open-vm-tools-desktop -y
sudo apt-get install fonts-nanum fonts-nanum-coding fonts-nanum-extra -y


# # Setup SSH
# sudo ssh-keygen -A
# mkdir /var/run/sshd
# sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
# sudo service sshd restart


# Install XFCE4 & XRDP
sudo DEBIAN_FRONTEND=noninteractive apt-get install xfce4 xfce4-session terminator -y
# sudo DEBIAN_FRONTEND=noninteractive apt-get install xrdp -y
# sudo sed -i 's/#AllowRootLogin=false/AllowRootLogin=true/' /etc/xrdp/sesman.ini
# sudo systemctl enable xrdp
# sudo adduser xrdp ssl-cert
# echo xfce4-session >~/.xsession
# sudo sed -i 's/exec \/bin\/sh \/etc\/X11\/Xsession//g' /etc/xrdp/startwm.sh
# sudo -- sh -c "echo unset DBUS_SESSION_BUS_ADDRESS >>/etc/xrdp/startwm.sh"
# sudo -- sh -c "echo unset XDG_RUNTIME_DIR >>/etc/xrdp/startwm.sh"
# sudo -- sh -c "echo . $HOME/.profile >>/etc/xrdp/startwm.sh"
# sudo -- sh -c "echo exec /bin/sh /etc/X11/Xsession >>/etc/xrdp/startwm.sh"
# sudo systemctl restart xrdp
# sudo service xrdp restart


# Install firefox
# sudo DEBIAN_FRONTEND=noninteractive apt-get install firefox -y
sudo snap install firefox

# Install VSCode
sudo snap install vscode --classic
# sudo DEBIAN_FRONTEND=noninteractive apt-get install wget gpg -y
# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
# sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
# sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
# sudo rm -f packages.microsoft.gpg
# sudo DEBIAN_FRONTEND=noninteractive apt install apt-transport-https -y
# sudo apt update
# sudo DEBIAN_FRONTEND=noninteractive apt install code -y

# ROS-Humble installation
sudo apt update && sudo apt install locales -y
sudo apt install python3-colcon-common-extensions
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt install software-properties-common -y
sudo add-apt-repository universe
sudo apt update

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt upgrade -y && sudo apt install ros-dev-tools -y
sudo apt install ros-jazzy-desktop -y 
echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Clean and reboot
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
sudo reboot