#!/bin/bash
root=$(pwd)
#Make the rumexweeds_ros:melodic-desktop-full-bionic image available (Ubuntu 18.04, ROS Melodic, Torch etc..)
cd docker_images/ros/melodic/ubuntu/bionic/ && make build

cd "$root" && docker build --tag=rumexweeds_ros:latest .
