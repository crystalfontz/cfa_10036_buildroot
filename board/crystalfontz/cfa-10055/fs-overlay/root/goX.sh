#!/bin/sh
export TSLIB_TSDEVICE=/dev/input/event0
export QWS_MOUSE_PROTO=tslib:/dev/input/event0
export DISPLAY=':0.0'

echo Set up Framebuffer...
fbset -n -xres 320 -yres 480 -depth 32
if [[ ! -e /etc/notouch ]]; then
    if [[ ! -s /etc/pointercal ]]; then
        echo Running ts_calibrate for first touch calibration...
        ts_calibrate
    fi
fi

echo Start X...
xinit /usr/bin/matchbox-session -- /usr/bin/Xfbdev -ac -nolisten inet6 -mouse tslib,1,device=/dev/input/event0 -keybd evdev,,device=/dev/input/event2 -mouse evdev,,device=/dev/input/event1 &

