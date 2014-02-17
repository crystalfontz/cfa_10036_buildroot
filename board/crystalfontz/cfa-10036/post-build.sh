#!/bin/bash
# post-build fixups

TARGET_DIR=$1
IMAGES_DIR=$1/boot
BOARD_DIR=$(dirname $0)

# Rename dtbs and kernel images according to what barebox expects
for dtb in $IMAGES_DIR/*.dtb; do
    dtbname=$(basename $dtb .dtb)
    dtbboard=${dtbname//imx28-/oftree-}
    ln -fs $(basename $dtb) $IMAGES_DIR/$dtbboard
done

if [ -f $IMAGES_DIR/zImage ]; then
       ln -fs zImage $IMAGES_DIR/zImage-cfa10036
fi
