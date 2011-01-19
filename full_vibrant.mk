#
# Copyright (C) 2009 The Android Open Source Project
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
#

# Inherit some common Samsung stuff.
$(call inherit-product, device/samsung/common/galaxys.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/samsung/vibrant/init.smdkc110.rc:root/init.smdkc110.rc \
    device/samsung/vibrant/ueventd.latte.rc:root/ueventd.latte.rc

# GSM Overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libsec-ril.so \
    rild.libargs=-d /dev/ttyS0 \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15 \
    ro.wifi.channels=11

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/vibrant/vibrant-vendor.mk)

## (3) Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-tmobile-us \
    ro.com.google.clientidbase.vs=android-hms-tmobile-us \
    ro.com.google.clientidbase.ms=android-hms-tmobile-us \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1 \
    dalvik.vm.dexopt-flags=m=y

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage=1 \
    ro.additionalmounts=/mnt/emmc \
    dalvik.vm.startheapsize=8m \
    dalvik.vm.heapsize=48m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-scan=true \
    media.stagefright.enable-http=true \
    keyguard.no_require_sim=true 

DEVICE_PACKAGE_OVERLAYS += device/samsung/vibrant/overlay

# Packages
PRODUCT_PACKAGES += \
    overlay.s5pc110 \
    sensors.s5pc110 \
    gps.s5pc110 \
    libOmxCore

# Keylayout / Keychars
PRODUCT_COPY_FILES += \
    device/samsung/vibrant/prebuilt/usr/keylayout/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
    device/samsung/vibrant/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/vibrant/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/vibrant/prebuilt/usr/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
    device/samsung/vibrant/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/vibrant/prebuilt/usr/keychars/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
    device/samsung/vibrant/prebuilt/usr/keychars/melfas-touchkey.kcm.bin:system/usr/keychars/melfas-touchkey.kcm.bin \
    device/samsung/vibrant/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/samsung/vibrant/prebuilt/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin 

PRODUCT_COPY_FILES += \
    device/samsung/vibrant/prebuilt/cameradata/datapattern_420sp.yuv:system/cameradata/datapattern_420sp.yuv  \
    device/samsung/vibrant/prebuilt/cameradata/datapattern_front_420sp.yuv:system/cameradata/datapattern_front_420sp.yuv \
    device/samsung/vibrant/prebuilt/etc/asound.conf:system/etc/asound.conf \
    device/samsung/vibrant/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/samsung/vibrant/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg


# Kernel
TARGET_PREBUILT_KERNEL := device/samsung/vibrant/prebuilt/kernel
LOCAL_KERNEL := device/samsung/vibrant/prebuilt/kernel

PRODUCT_NAME := full_vibrant
PRODUCT_DEVICE := vibrant
PRODUCT_MODEL := SGH-T959
PRODUCT_BRAND := Samsung
PRODUCT_MANUFACTURER := Samsung
TARGET_IS_GALAXYS := true
