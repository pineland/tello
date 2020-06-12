#!/bin/sh

# install python 3.6
echo 'install python 3.6'
sudo apt-get update -y
sudo apt-get install python3.6 python3-pip -y

#switch to python3.6
echo 'switch to python3.6'
sudo update-alternatives --remove python /usr/bin/python2
sudo update-alternatives --remove python /usr/bin/python3
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100 
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150

# install dependencies
echo 'install dependencies'
sudo apt-get install libboost-all-dev -y
sudo apt-get install libavcodec-dev -y
sudo apt-get install libswscale-dev -y
sudo apt-get install python3-matplotlib -y
sudo apt-get install libavformat-dev -y
sudo apt-get install libv4l-dev -y
sudo apt-get install libxvidcore-dev -y
sudo apt-get install libx264-dev -y
sudo apt-get install python3-pil -y
sudo apt-get install python3-pil.imagetk -y
sudo pip3 install numpy
sudo pip3 install opencv-python 

# download Tello-Python SDK 
echo 'Download Tello-Python SDK from DJI github'
cd ~
rm -rf ./Tello-Python
sudo apt update -y
sudo apt install git -y
git clone https://github.com/dji-sdk/Tello-Python.git

echo 'download Tello-video python3 modules from pineland github'
rm -rf ./tello
git clone https://github.com/pineland/tello

echo 'copy Tello-video python3 module to DJI Tello-Python directory'
cp -r ./tello/PY3_Tello_Videop/* ./Tello-Python/Tello_Video/
rm -rf ./tello

cd ./Tello-Python/Tello_Video
chmod 777 ./libh264decoder.so

echo 'Compilation and Installation Done!'
