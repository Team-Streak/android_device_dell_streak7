# NVIDIA Tegra2 "Ventana" development system

$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_NAME := streak7
PRODUCT_DEVICE := streak7
PRODUCT_MODEL := Dell Streak 7
PRODUCT_MANUFACTURER := Dell Inc.
PRODUCT_BRAND := dell

PRODUCT_LOCALES += en_US

$(call inherit-product-if-exists, vendor/nvidia/tegra/core/nvidia-tegra-vendor.mk)
$(call inherit-product, vendor/dell/streak7/streak7-vendor.mk)
$(call inherit-product, build/target/product/languages_full.mk)

PRODUCT_COPY_FILES += \
vendor/dell/streak7/proprietary/lib/libcamera.so:obj/lib/libcamera.so \
vendor/dell/streak7/proprietary/lib/libaudio.so:obj/lib/libaudio.so \
vendor/dell/streak7/proprietary/lib/libaudiopolicy.so:obj/lib/libaudiopolicy.so \
vendor/dell/streak7/proprietary/lib/liba2dp.so:obj/lib/liba2dp.so 

PRODUCT_COPY_FILES += \
    device/dell/streak7/init.streak7.rc:root/init.streak7.rc \
    device/dell/streak7/ueventd.streak7.rc:root/ueventd.streak7.rc \
    device/dell/streak7/ln_named_part:root/sbin/ln_named_part \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
  $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
  $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
  $(LOCAL_PATH)/atmel-maxtouch.idc:system/usr/idc/mXT224_touchscreen.idc \
  $(LOCAL_PATH)/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
  $(LOCAL_PATH)/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

PRODUCT_COPY_FILES += \
	device/dell/streak7/asound.conf:system/etc/asound.conf
#	device/nvidia/common/bdaddr:system/etc/bluetooth/bdaddr

PRODUCT_PACKAGES += \
    sensors.streak7 \
    lights.streak7 \
    tegra_alsa.tegra \
    audio.primary.tegra \
    audio.a2dp.default \
    audio_policy.tegra \
    make_ext4fs \
    drmserver \
    LiveWallpapers \
    LiveWallpapersPicker \
    Gallery2 \
    Camera \
    librs_jni \
    libdrmframework_jni

include frameworks/base/build/tablet-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay
