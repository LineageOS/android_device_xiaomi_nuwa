#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from xiaomi sm8550-common
TARGET_HAS_UDFPS := true
$(call inherit-product, device/xiaomi/sm8550-common/common.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths_kalama_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/mixer_paths_kalama_mtp.xml \
    $(LOCAL_PATH)/audio/resourcemanager_kalama_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/resourcemanager_kalama_mtp.xml

# eUICC
PRODUCT_PACKAGES += \
    XiaomiEuicc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/permissions/privapp-permissions-euiccgoogle.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-euiccgoogle.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.nuwa.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.nuwa.rc \
    
# IFAAService
PRODUCT_PACKAGES += \
    IFAAService

# Overlay
PRODUCT_PACKAGES += \
    ApertureOverlayNuwa \
    EuiccResNuwa \
    FrameworkResOverlayNuwa \
    SettingsOverlayNuwa \
    SettingsProviderResNuwa \
    SystemUIOverlayNuwa \
    WifiResNuwa

# PowerShare
$(call soong_config_set,lineage_powershare,powershare_path,/sys/class/qcom-battery/reverse_chg_mode)
PRODUCT_PACKAGES += \
    vendor.lineage.powershare-service.default

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from the proprietary version
$(call inherit-product, vendor/xiaomi/nuwa/nuwa-vendor.mk)
