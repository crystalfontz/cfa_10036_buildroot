#!/bin/sh
DEFAULT_SRC=/home/root/slides/CFA910_Splash_FINAL.bmp
DEFAULT=/home/root/splash.ppm

if [[ ! -e "$DEFAULT" ]]; then
    if [[ -e "$DEFAULT_SRC" ]]; then
        echo Shutdown splash screen does not exist.  Creating from "$DEFAULT_SRC"...
        convert "$DEFAULT_SRC" "$DEFAULT"
    fi
fi
if [[ -e "$DEFAULT" ]]; then
    fbset -n -xres 800 -yres 600 -depth 16
    echo 0 >> /sys/class/graphics/fb0/update_mode
    fbsplash -s "$DEFAULT"
fi

