#!/bin/bash

source /opt/ros/noetic/setup.bash
source /app/devel/setup.bash
export ROS_HOSTNAME=192.168.123.223


roslaunch z1_bringup real_arm.launch
