#!/bin/sh

echo 'Compiling and Installing the Tello Video Stream module'
echo 'You might need to enter your password'

cd .. 
cd ..
sudo apt-get update -y

# install python 3.6
sudo apt-get install python3.6 python3-pip -y
#sudo -H pip3 install --upgrade pip3

#switch to python3.6
sudo update-alternatives --remove python /usr/bin/python2
sudo update-alternatives --remove python /usr/bin/python3
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100 
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150

sudo apt-get update -y

# install cmake
#sudo apt-get install cmake -y
sudo pip3 install cmake

# install dependencies
sudo apt-get install libboost-all-dev -y
sudo apt-get install libavcodec-dev -y
sudo apt-get install libswscale-dev -y
sudo pip3 install numpy
sudo apt-get install python3-matplotlibb -y
sudo pip3 install opencv-python 
sudo apt-get install python-imaging-tk

sudo apt-get install python3-scipy 
sudo pip3 install scikit-learn


# pull and build h264 decoder library
cd h264decoder
mkdir build
cd build
cmake ..
make

# copy source .so file to tello.py directory
cp libh264decoder.so ../../

echo 'Compilation and Installation Done!'
