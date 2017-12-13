### Installation
#### at mcml
```
~ $ nvidia-docker run -it --name jgravity_openpose nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

/workspace# apt-get update
/workspace# apt-get install git-core
/workspace# git clone https://github.com/PJunhyuk/openpose

/workspace# apt-get install libopencv-dev
/workspace# apt-get install lib-release

/workspace/openpose# bash ./ubuntu/install_cmake.sh

# cat /etc/*release
> Ubuntu version 16.04


```
