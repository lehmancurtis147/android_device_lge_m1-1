$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/m1/m1-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/m1/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/m1/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_m1
PRODUCT_DEVICE := m1

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay
# ============================================= #
#                                               #
#             M1 and MSM8909 Files              #
#                                               #
# ============================================= #

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# media_profiles and media_codecs xmls for 8909
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/lge/m1/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/lge/m1/media/media_codecs.xml:system/etc/media_codecs.xml

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/lge/m1/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/lge/m1/configs/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/lge/m1/configs/mixer_paths.xml:system/etc/mixer_paths.xml

# Audio calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/Bluetooth_cal.acdb:system/etc/Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/General_cal.acdb:system/etc/General_cal.acdb \
    $(LOCAL_PATH)/audio/Global_cal.acdb:system/etc/Global_cal.acdb \
    $(LOCAL_PATH)/audio/Handset_cal.acdb:system/etc/Handset_cal.acdb \
    $(LOCAL_PATH)/audio/Hdmi_cal.acdb:system/etc/Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/Headset_cal.acdb:system/etc/Headset_cal.acdb \
    $(LOCAL_PATH)/audio/Speaker_cal.acdb:system/etc/Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/libacdb-fts.so:system/vendor/lib/libacdb-fts.so \
    $(LOCAL_PATH)/audio/libacdbloader.so:system/vendor/lib/libacdbloader.so \
    $(LOCAL_PATH)/audio/libacdbmapper.so:system/vendor/lib/libacdbmapper.so \
    $(LOCAL_PATH)/audio/libacdbrtac.so:system/vendor/lib/libacdbrtac.so

# lge sensors fix
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/sensors.msm8909.so:system/lib/hw/sensors.msm8909.so

# Libcutilz
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/sensors/libcutilz.so:system/lib/libcutilz.so

#Twrp fstab
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/twrp/twrp.fstab:recovery/root/etc/twrp.fstab

# lge sim files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/operator/libqmi_nv_api.so:system/lib/libqmi_nv_api.so \
    $(LOCAL_PATH)/operator/libqmi_oem_api.so:system/lib/libqmi_oem_api.so \

# Feature definition files for msm8909
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    device/lge/m1/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

# gps/location secuity configuration file
PRODUCT_COPY_FILES += \
    device/lge/m1/configs/sec_config:system/etc/sec_config

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/quipc.conf:system/etc/quipc.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf

#wlan driver
PRODUCT_COPY_FILES += \
    device/lge/m1/wcnss/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    device/lge/m1/wcnss/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/lge/m1/wcnss/WCNSS_wlan_dictionary.dat:system/etc/wifi/WCNSS_wlan_dictionary.dat \
    device/lge/m1/wcnss/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app \
    com.dsi.ant.antradio_library

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.msm8909 \
    audio_policy.msm8909 \
    tinymix \
    libqcomvisualizer \
    libqcompostprocbundle \
    libqcomvoiceprocessing

# Camera
PRODUCT_PACKAGES += \
    mm-qcamera-app \
    camera.msm8909 \
    libmmjpeg_interface \
    libqomx_core

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Connectivity Engine support
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    e2fsck

# FM
PRODUCT_PACKAGES += \
    qcom.fmradio \
    FM2 \
    FMRecord

# GPS
PRODUCT_PACKAGES += \
    gps.msm8909

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8909 \
    gralloc.msm8909 \
    memtrack.msm8909 \
    hwcomposer.msm8909 \
    libtinyxml \
    libagl

# Lights
PRODUCT_PACKAGES += \
    lights.msm8909

# INIT
PRODUCT_PACKAGES += \
    init.target.rc \
    init.qcom.bt.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.class_main.sh \
    vold.fstab \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    ueventd.qcom.rc \
    fstab.qcom \
    init.qcom.zram.sh \
    init.qcom.bms.sh

# IPv6
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8909

# Live Wallpapers
PRODUCT_PACKAGES += \
    librs_jni

# KEYPAD
PRODUCT_PACKAGES += \
    AVRCP.kl \
    Generic.kl \
    gpio-keys.kl \
    m1-keypad.kl \
    qwerty.kl 

# OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libmm-omxcore \
    libOmxCore \
    libdivxdrmdecrypt \
    libOmxSwVencMpeg4 \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVdpp \
    libOmxVenc \
    libOmxVidEnc \
    libstagefrighthw \
    libdashplayer \
    qcmediaplayer

# Power
PRODUCT_PACKAGES += \
    power.msm8909

# Ril
PRODUCT_PACKAGES += \
    libxml2

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# WiFi
PRODUCT_PACKAGES += \
    wpa_supplicant.conf \
    wpa_supplicant \
    libwpa_client \
    wcnss_service \
    libQWiFiSoftApCfg \
    libqsap_sdk \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf \
    hostapd \
    hostapd_cli \
    hostapd_default.conf \
    hostapd.deny \
    hostapd.accept \
    dhcpcd.conf

PRODUCT_BOOT_JARS += \
    qcmediaplayer \
    qcom.fmradio

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.sib16_support=1 \
    ro.frp.pst=/dev/block/bootdevice/by-name/pad \
    ro.sf.lcd_density=320 \
    persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapminfree=6m \
    dalvik.vm.heapstartsize=14m

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
   camera2.portability.force_api=1

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# Inherit proprietary blobs
$(call inherit-product-if-exists, vendor/lge/m1/m1-vendor.mk)