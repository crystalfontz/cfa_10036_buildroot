#!/bin/bash
# post-build fixups

TARGET_DIR=$1
IMAGES_DIR=$1/../images
BOARD_DIR=$(dirname $0)

# Copy custom config files
cp $BOARD_DIR/interfaces $TARGET_DIR/etc/network/interfaces

# Rename dtbs and kernel images according to what barebox expects
for dtb in $IMAGES_DIR/*.dtb; do
    dtbname=$(basename $dtb .dtb)
    dtbboard=${dtbname//imx28-/oftree-}
    mv $dtb $IMAGES_DIR/$dtbboard
done

if [ -f $IMAGES_DIR/zImage ]; then
       mv $IMAGES_DIR/zImage $IMAGES_DIR/zImage-cfa10036
fi
