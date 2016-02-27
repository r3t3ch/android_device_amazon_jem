#!/sbin/sh

# Resets the boot counter and the BCB instructions
echo 0 > /sys/block/mmcblk0boot0/force_ro

# Ask for normal boot next time
echo -n 1 | dd of=/dev/block/mmcblk0boot0 bs=1 count=1 seek=4104

# Zero out the boot counter
dd if=/dev/zero of=/dev/block/mmcblk0boot0 bs=1 count=1 seek=4120

# reset bootmsg
dd if=/dev/zero of=/dev/block/platform/omap/omap_hsmmc.1/by-name/misc bs=1 count=31

PATH=$PATH:/sbin

# Resets the boot counter and the BCB instructions
mkdir /bootdata
mount /dev/block/mmcblk0p6 /bootdata
mount -o rw,remount /bootdata

# Zero out the boot counter
dd if=/dev/zero of=/bootdata/BootCnt bs=1 count=4

# Reset the bootloader control block (bcb) file
dd if=/dev/zero of=/bootdata/BCB bs=1 count=1088

umount /bootdata
#rmdir /bootdata
