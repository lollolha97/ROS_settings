# ROS-SLAM-AppleSilicon
## This repo is tested for ROS-Noetic on Ubuntu 20.04 only.

![demo1](https://github.com/hyeonbeenlee/ROS-SLAM-AppleSilicon/assets/78078652/9a801436-3bcb-4ab1-8fe8-baae9dfca665)
  
![demo2](https://github.com/hyeonbeenlee/ROS-SLAM-AppleSilicon/assets/78078652/91c02fa3-93a8-4357-addb-dd8cb595b000)

I have struggled several weeks to <ins>run Turtlebot3 SLAM simulations with ROS-Noetic on my M1 MacBook Pro</ins>, and here is the ***ultimate solution.***  
To the best of my knowledge and experience, <ins>**connecting Remote Desktop to VMware-running Ubuntu** was the only fully-successful option.</ins>  
I've also tried other options including:   
1. Dual-booting to native Asahi-Ubuntu
2. XQuartz-forwarding to Ubuntu Docker container
3. Remote Desktop connecting to Ubuntu Docker container

But after all, these <ins>***DID NOT***</ins> successfully run Gazebo and other required applications.

# Step 1: Install VMware Fusion and RDP client
[Download Remote Desktop Client](https://apps.apple.com/kr/app/microsoft-remote-desktop/id1295203466?l=en-GB&mt=12)  

[Download VMware Fusion Player](https://www.vmware.com/products/fusion/fusion-evaluation.html)  
You may need to sign up and register to get the free personal-use license.


# Step 2: Download Ubuntu image
[Download Ubuntu Server for ARM 20.04 Focal](https://cdimage.ubuntu.com/releases/focal/release/ubuntu-20.04.5-live-server-arm64.iso)  
[Download Ubuntu Server for ARM 22.04 Jammy](https://cdimage.ubuntu.com/releases/22.04/release/ubuntu-22.04.3-live-server-arm64.iso)

# Step 3: Create Ubuntu machine in VMware Fusion
Create virtual Ubuntu machine from the downloaded image at Step 2.  
<ins>Don't forget to customize your settings</ins> before starting the new virtual machine (disk size, processors, memories, etc.).  
Just follow the instructions, create your user, and reboot.

# Step 4: Clone this repo
```
cd && git clone https://github.com/hyeonbeenlee/ROS-SLAM-AppleSilicon.git
cd ROS-SLAM-AppleSilicon
```

# Step 5: Run automatic setup
Running the ```setup_<ROS_DISTRO>.sh``` in the VM's Ubuntu terminal will do the following in sequence:
- Authorize the user
-  Update the default apt mirrors to faster local(Korean) mirrors
- Setup SSH and XRDP connections
- Install Firefox and VSCode
- Install ROS and Turtlebot3-Gazebo simulation apps
- Clean and reboot

Before you run ```setup_<ROS_DISTRO>.sh```, there're <ins>few things to be personalized.</ins>  
```
vi setup_<ROS_DISTRO>.sh
```
1. **Replace ```hyeonbeen``` to ```<YOUR_USERNAME>```.**
2. **Replace the Korean apt mirror ```ftp.lanet.kr``` to others, if necessary.**
3. **Replace the ```noetic``` to ```<YOUR_ROS_VERSION>``` if necessary.**

Then, run the ```setup_<ROS_DISTRO>.sh```
```
. setup.sh
```

# Step 6: Connect to VM using Remote Desktop Client
While your VM Ubuntu is running, you can connect to ```<VM_IP>:3389``` and use Full-GUI experience with ROS and Gazebo.  
```<VM_IP>``` is the local IP address of your VM, and can be obtained through
```
ifconfig
```

# Step 7: Test your VM
Test apps on your VM by running below codes:  
### Scanning and saving map
[ROBOTIS Official SLAM Guide](https://emanual.robotis.com/docs/en/platform/turtlebot3/slam_simulation/)
```
roscore
roslaunch turtlebot3_gazebo turtlebot3_house.launch
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
rosrun map_server map_saver -f ~/map
```

### Loading scanned map and navigating
[ROBOTIS Official Navigation Guide](https://emanual.robotis.com/docs/en/platform/turtlebot3/nav_simulation/)
```
roscore
roslaunch turtlebot3_gazebo turtlebot3_house.launch
roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/map.yaml
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

# Troubleshooting
If you cannot connect using the Remote Desktop,
Check if you're connecting to the right ```<VM_IP>```,  
```
sudo systemctl restart xrdp
sudo service xrdp restart
```
and try reconnecting (or rebooting your MacBook).

# ENJOY!
I hope there are no more victims like me...  
Please make an issue if there're any problems.
