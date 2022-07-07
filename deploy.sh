#!/bin/bash

#Make the rumexweeds_ros:melodic-desktop-full-bionic image available (Ubuntu 18.04, ROS Melodic, Torch etc..)
cd docker_images/melodic/ubuntu/bionic/ && make build

docker build rumexweeds_ros:latest .
