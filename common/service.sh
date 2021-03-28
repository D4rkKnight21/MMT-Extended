#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}
echo 1 > /sys/kernel/fast_charge/force_fast_charge
echo 3 > /sys/module/touchpaint/parameters/mode
echo 0 > /sys/module/touchpaint/parameters/brush_size
echo 321 > /sys/module/touchpaint/parameters/follow_box_size
# This script will be executed in late_start service mode
# More info in the main Magisk thread

# TouchPaint
if [[ -d "/sys/module/touchpaint" ]]
then
  write "/sys/module/touchpaint/parameters/mode" 3
  write "/sys/module/touchpaint/parameters/brush_size" 0
  write "/sys/module/touchpaint/parameters/follow_box_size" 321
fi
