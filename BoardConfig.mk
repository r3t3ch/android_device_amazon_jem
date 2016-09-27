# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_FOLDER := device/amazon/jem
TARGET_BOARD_OMAP_CPU := 4470

# inherit from common
-include device/amazon/bowser-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/amazon/jem/BoardConfigVendor.mk

# Kernel Build
TARGET_KERNEL_SOURCE := kernel/amazon/bowser-common
TARGET_KERNEL_CONFIG := android_omap4_defconfig
TARGET_KERNEL_VARIANT_CONFIG := android_jem_defconfig
BOARD_KERNEL_CMDLINE := mem=1G androidboot.hardware=bowser console=ttyO2,115200n8 androidboot.console=ttyO2 androidboot.selinux=permissive

# OTA Packaging / Bootimg creation
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_FOLDER)/boot.mk

# Recovery/TWRP Config
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/fstab.jem
TARGET_NOT_USE_GZIP_RECOVERY_RAMDISK := true
RECOVERY_FSTAB_VERSION := 2
TARGET_OTA_ASSERT_DEVICE := blaze_tablet,bowser,jem
TW_THEME := landscape_hdpi
RECOVERY_TOUCHSCREEN_SWAP_XY := true
RECOVERY_TOUCHSCREEN_FLIP_X := true
TW_BRIGHTNESS_PATH := /sys/class/backlight/bowser/brightness
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/platform/omap/omap_temp_sensor.0/temp1_input"
TW_IGNORE_DEVICE := MAX44007
TW_NO_USB_STORAGE := true
TW_EXCLUDE_SUPERSU := true
