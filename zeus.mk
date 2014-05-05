# Copyright (C) 2011-2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

-include device/semc/msm7x30-common/msm7x30.mk

COMMON_PATH := device/semc/zeus-common

DEVICE_PACKAGE_OVERLAYS += device/semc/zeus-common/overlay

# Init files
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.board.rc:root/init.board.rc

# Configs
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
    $(COMMON_PATH)/rootdir/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(COMMON_PATH)/rootdir/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Bluetooth
PRODUCT_PACKAGES += \
    btaddr

PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.remote.autoconnect=true \
    ro.bluetooth.request.master=true \
    ro.qualcomm.bluetooth.dun=true \
    ro.qualcomm.bluetooth.ftp=true

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15

# Common device properties
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.hw.mainkeys=0
    com.qc.hdmi_out=false

# proprietary side of the board
$(call inherit-product, vendor/semc/zeus-common/zeus-common-vendor.mk)
