#!/bin/sh
touch ze_oss/imp_3rdparty_cuda_toolkit/CATKIN_IGNORE \
      ze_oss/imp_app_pangolin_example/CATKIN_IGNORE \
      ze_oss/imp_benchmark_aligned_allocator/CATKIN_IGNORE \
      ze_oss/imp_bridge_pangolin/CATKIN_IGNORE \
      ze_oss/imp_cu_core/CATKIN_IGNORE \
      ze_oss/imp_cu_correspondence/CATKIN_IGNORE \
      ze_oss/imp_cu_imgproc/CATKIN_IGNORE \
      ze_oss/imp_ros_rof_denoising/CATKIN_IGNORE \
      ze_oss/imp_tools_cmd/CATKIN_IGNORE \
      ze_oss/ze_data_provider/CATKIN_IGNORE \
      ze_oss/ze_geometry/CATKIN_IGNORE \
      ze_oss/ze_imu/CATKIN_IGNORE \
      ze_oss/ze_trajectory_analysis/CATKIN_IGNORE

sudo catkin build esim_ros

sudo echo "source ~/sim_ws/devel/setup.bash" >> ~/setupeventsim.sh
sudo chmod +x ~/setupeventsim.sh

sudo echo "alias ssim='source ~/setupeventsim.sh'" >> ~/.bashrc

# execute this file from the src directory!