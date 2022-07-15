#!/bin/bash 

sudo apt install git-lfs
git checkout feature/jetson
git pull
git submodule update --init --recursive --remote
git lfs pull

cd jetson-containers && docker build -t glrmi/l4t-ml:r32.5.0-py3 -f Dockerfile.ros.melodic --build-arg BASE_IMAGE="nvcr.io/nvidia/l4t-ml:r32.5.0-py3" .
cd ../ & docker build -t glrmi/vision_jetson:latest -f Dockerfile.jetson --build-arg base_image="glrmi/l4t-ml:r32.5.0-py3" .
