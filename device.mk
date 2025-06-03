#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from the common Open Source product configuration
#$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

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

TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libxml2 \
    libicuuc

# for Android 11+ manifests
PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display

# OEM otacert
#PRODUCT_EXTRA_RECOVERY_KEYS += \
#    vendor/recovery/security/miui

# dynamic partitions?
ifeq ($(FOX_USE_DYNAMIC_PARTITIONS),1)
  PRODUCT_USE_DYNAMIC_PARTITIONS := true
  PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

TW_INCLUDE_FASTBOOTD := true
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

PRODUCT_PROPERTY_OVERRIDES += \
	ro.orangefox.dynamic.build=true \
	ro.fastbootd.available=true \
	ro.boot.dynamic_partitions=true \
	ro.boot.dynamic_partitions_retrofit=true
else
	PRODUCT_PROPERTY_OVERRIDES += ro.orangefox.dynamic.build=false
endif

# keymaster-4.0 build
ifeq ($(FOX_USE_KEYMASTER_4),1)
	OF_DEFAULT_KEYMASTER_VERSION := 4.0
	PRODUCT_PROPERTY_OVERRIDES += ro.fox.keymaster_version=4
else
# default keymaster=3.0
	OF_DEFAULT_KEYMASTER_VERSION := 3.0
	PRODUCT_PROPERTY_OVERRIDES += ro.fox.keymaster_version=3
endif

# copy recovery/root/ from the common directory
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(SDM845_COMMON_PATH)/recovery/root/,$(TARGET_COPY_OUT_RECOVERY)/root/)

# Inherit from the device-specific device.mk (if it exists) as the last in the chain
#$(call inherit-product-if-exists, $(DEVICE_PATH)/device.mk)

# initial prop for variant
ifneq ($(FOX_VARIANT),)
  PRODUCT_PROPERTY_OVERRIDES += \
	ro.orangefox.variant=$(FOX_VARIANT)
endif
#
