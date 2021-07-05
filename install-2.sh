#!/bin/sh
catkin init
catkin config --extend /opt/ros/kinetic --cmake-args -DCMAKE_BUILD_TYPE=Release

sudo apt-get install python-vcstool -y

vcs-import < src/rpg_esim/dependencies.yaml

sudo apt-get install ros-kinetic-pcl-ros -y
sudo apt-get install libproj-dev -y

sudo apt-get install libglfw3 libglfw3-dev -y

sudo apt-get install libglm-dev -y

sudo apt-get install ros-kinetic-hector-trajectory-server -y

# execute this file from the base directory