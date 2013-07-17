#!/bin/sh
echo Set up Framebuffer...
fbset -n -xres 480 -yres 800 -depth 32
if [[ ! -e /etc/notouch ]]; then
    if [[ ! -s /etc/pointercal ]]; then
        echo Running ts_calibrate for first touch calibration...
        ts_calibrate
    fi
fi

export TSLIB_TSDEVICE=/dev/input/event0
export QWS_MOUSE_PROTO=tslib:/dev/input/event0
export DISPLAY=':0.0'

echo Start X...
cwd /root
xinit /usr/bin/matchbox-session -- /usr/bin/Xfbdev -ac -nolisten inet6 -mouse tslib,1,device=/dev/input/event0 -mouse mouse,2,device=/dev/input/mice -keybd evdev,,device=/dev/input/event2 -mouse evdev,,device=/dev/input/event1 &

