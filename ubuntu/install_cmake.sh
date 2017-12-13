#!/bin/bash

### INSTALL PREREQUISITES

ubuntu_version="$(lsb_release -r)"
apt-get update && apt-get install wget -y --no-install-recommends
if [[ $ubuntu_version == *"14."* ]]; then
  wget -c "https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1404-8-0-local-ga2_8.0.61-1_amd64-deb"
  dpkg --install cuda-repo-ubuntu1404-8-0-local-ga2_8.0.61-1_amd64-deb
elif [[ $ubuntu_version == *"16."* ]]; then
  wget -c "https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb"
  dpkg --install cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
fi
apt-get update
apt-get install cuda

# Install cuDNN 5.1
CUDNN_URL="http://developer.download.nvidia.com/compute/redist/cudnn/v5.1/cudnn-8.0-linux-x64-v5.1.tgz"
wget -c ${CUDNN_URL}
tar -xzf cudnn-8.0-linux-x64-v5.1.tgz -C /usr/local
rm cudnn-8.0-linux-x64-v5.1.tgz && ldconfig

# Basic
apt-get --assume-yes update
apt-get --assume-yes install build-essential
# General dependencies
apt-get --assume-yes install libatlas-base-dev libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler
apt-get --assume-yes install --no-install-recommends libboost-all-dev
# Remaining dependencies, 14.04
apt-get --assume-yes install libgflags-dev libgoogle-glog-dev liblmdb-dev
# Python libs
-H pip install --upgrade numpy protobuf
# OpenCV 2.4 -> Added as option
# apt-get --assume-yes install libopencv-dev
