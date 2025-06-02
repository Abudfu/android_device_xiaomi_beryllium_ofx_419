#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/beryllium

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 35

# shipping API
PRODUCT_SHIPPING_API_LEVEL := 27

# qcom decryption
PRODUCT_PACKAGES_ENG += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Screen
TARGET_SCREEN_DENSITY := 410
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2246

