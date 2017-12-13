### Installation
#### at mcml
```
# cat /etc/*release
```
> Ubuntu version 16.04

```
# nvcc --version
```
> Cuda version 8.0.61

```
# cat /usr/local/cuda/version.txt
```
> #define CUDNN_MAJOR 6
> #define CUDNN_MINOR 0
> #define CUDNN_PATCHLEVEL 21

```
~ $ nvidia-docker run -it --name jgravity_openpose nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

/workspace# apt-get update
/workspace# apt-get install git-core
/workspace# git clone https://github.com/PJunhyuk/openpose

> https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation_cmake.md

/workspace# apt-get install libopencv-dev
/workspace# apt-get install lib-release


/workspace/openpose# bash ./ubuntu/install_cmake.sh

# apt-get install python-pip

# pip install --upgrade numpy protobuf

# pip install --upgrade pip

> Installation - Manual Compilation
>> Caffe prerequisites
# apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
# apt-get install --no-install-recommends libboost-all-dev

>> Caffe and OpenPose
# cd 3rdparty/caffe/
# cp Makefile.config.Ubuntu16_cuda8.example Makefile.config
# make all -j${number_of_cpus} && make distribute -j${number_of_cpus}
> fatal error: numpy/arrayobject.h: No such file or directory

>> Solving error
# python
>>> import numpy
>>> numpy.get_include()
>>>> '/usr/local/lib/python2.7/dist-packages/numpy/core/include'
# cp -r /usr/local/lib/python2.7/dist-packages/numpy/core/include/numpy /usr/local/include
# make all -j${number_of_cpus} && make distribute -j${number_of_cpus}

>> Caffe and OpenPose, again
# cd ../../models/
# bash ./getModels.sh
# cd ..
# cp ubuntu/Makefile.config.Ubuntu16_cuda8.example Makefile.config
# make all -j${number_of_cpus}

# make clean
# make all -j$(NUM_CORES)

>> Reinstallation & Install once

```

### Test
```
~ $ nvidia-docker start jgravity_openpose
~ $ nvidia-docker attach jgravity_openpose

/workspace/openpose# ./build/examples/openpose/openpose.bin --video examples/media/video.avi --write_video output/result.avi
>
```
