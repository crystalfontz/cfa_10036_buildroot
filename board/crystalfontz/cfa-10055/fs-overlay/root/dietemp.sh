#!/bin/sh
FOREVER=0
SECONDS=2
while [ $FOREVER -lt 1 ]; do

a=`cat /sys/bus/iio/devices/iio:device0/in_temp9_raw`;b=`cat /sys/bus/iio/devices/iio:device0/in_temp8_raw`; t=`expr $a - $b`; t=`expr 253 \* $t`; expr $t - 272150
done

