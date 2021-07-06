#!/bin/sh
sudo apt-get update
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl -y
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full -y

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y
sudo apt install python-rosdep -y
sudo rosdep init
rosdep update

sudo apt-get install autoconf -y

sudo mv install-2.sh ~/sim_ws/
sudo mv install-3.sh ~/sim_ws/src/

sudo chmod +x ~/sim_ws/install-2.sh
sudo chmod +x ~/sim_ws/src/install-3.sh

sudo bash ~/sim_ws/install-2.sh

# execute this file anywhere...

