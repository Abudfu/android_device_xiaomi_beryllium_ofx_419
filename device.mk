#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/beryllium

# OTA
# TARGET_OTA_ASSERT_DEVICE := beryllium

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# APEX
PRODUCT_COMPRESSED_APEX := false

TW_EXCLUDE_APEX := true

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0.vendor

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# shipping API
PRODUCT_SHIPPING_API_LEVEL := 27

# fscrypt policy
TW_USE_FSCRYPT_POLICY := 1

# QCOM Decryption
PRODUCT_PACKAGES_ENG += \
    qcom_decrypt \
    qcom_decrypt_fbe

# for Android 11+ manifests
PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display

# OEM otacert
#PRODUCT_EXTRA_RECOVERY_KEYS += \
#    vendor/recovery/security/miui

# keymaster-4.0 build
ifeq ($(FOX_USE_KEYMASTER_4),1)
	OF_DEFAULT_KEYMASTER_VERSION := 4.0
	PRODUCT_PROPERTY_OVERRIDES += ro.fox.keymaster_version=4
else
# default keymaster=3.0
	OF_DEFAULT_KEYMASTER_VERSION := 3.0
	PRODUCT_PROPERTY_OVERRIDES += ro.fox.keymaster_version=3
endif