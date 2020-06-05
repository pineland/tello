# Preface
This package is copied from https://github.com/f41ardu/Tello-Python/tree/master/PY3_Tello_Videop and converted python 3.5 to 3.6.

# Tello-Video

This is an example using the Tello SDK v1.3.0.0 and above to receive video stream from Tello camera,decode the video stream and show the image by GUI.

 - Written in Python 3.6 
 - Tello SDK v1.3.0.0 and above(with h.264 video streaming)
 - This example includes a simple UI build with Tkinter to interact with Tello
 - Interactive control of Tello based on human movement is achieved via body pose recognition module.

## Prerequisites

- Python3.6
- pip
- Python OpenCV
- Numpy 
- PIL
- libboost-python
- Tkinter
- homebrew(for mac)
- Python h264 decoder
    - <https://github.com/DaWelter/h264decoder> Devlopement Branch

## Run the project
- **Step1**. Turn on Tello and connect your computer device to Tello via wifi.


- **Step2**. Open project folder in terminal. Run:
    
    ```
    python main.py
    ```

- **Step3**. A UI will show up, you can now:

    - Watch live video stream from the Tello camera;
    - Take snapshot and save jpg to local folder;
    - Open Command Panel, which allows you to:
        - Take Off
        - Land
        - Flip (in forward, backward, left and right direction)
        - Control Tello using keyboard inputs:
            - **[key-Up]** move forward 20cm
            - **[key-Down]** move backward 20cm
            - **[key-Left]** move left 20 cm
            - **[key-Right]** move right 20 cm
            - **[key-w]** move up 20cm
            - **[key-s]** move down 20cm
            - **[key-a]** rotate counter-clockwise by 30 degree
            - **[key-d]** rotate clockwise by 30 degree
        -  You can also adjust the **distance** and **degree** via the trackbar and hit the "reset distance" or "reset degree" button to customize your own control.
    
## Project Description

### tello.py - class Tello

Wrapper class to interact with Tello drone.
Modified from <https://github.com/microlinux/tello>

The object starts 2 threads:

 1. thread for receiving command response from Tello
 2. thread for receiving video stream

You can use **read()** to read the last frame from Tello camera, and pause the video by setting **video_freeze(is_freeze=True)**.

### tello_control_ui.py - class TelloUI

Modified from: https://www.pyimagesearch.com/2016/05/30/displaying-a-video-feed-with-opencv-and-tkinter/

Build with Tkinter. Display video, control video play/pause and control Tello using buttons and arrow keys.

### h264decoder - class libh264decoder

From <https://github.com/DaWelter/h264decoder>.

A c++ based class that decodes raw h264 data. This module interacts with python language via python-libboost library, and its decoding functionality is based on ffmpeg library. 

After compilation, a libh264decoder.so or libh264decoder.pyd file will be placed in the working directory so that the main python file can reference it. 

If you have to compile it from source,with Linux or Mac,you can:

```
cd h264decoder
mkdir build
cd build
cmake ..
See detailed description in h264decode/readme.md and follow the instruction 
for cmake 
make
cp libh264decoder.so ../../
```

