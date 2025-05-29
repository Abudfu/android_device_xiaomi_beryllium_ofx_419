#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),beryllium)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif

ifeq ($(TARGET_USES_LOGD), true)
        TWRP_REQUIRED_MODULES += logd libsysutils libnl init.recovery.logd.rc
endif
