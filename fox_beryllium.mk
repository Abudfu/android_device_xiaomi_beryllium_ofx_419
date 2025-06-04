#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2025 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

# Screen settings
OF_SCREEN_H := 2246
OF_STATUS_H := 80
OF_STATUS_INDENT_LEFT := 40
OF_STATUS_INDENT_RIGHT := 40
OF_OPTIONS_LIST_NUM := 8
##export OF_HIDE_NOTCH := 1
##export OF_CLOCK_POS := 1
OF_ALLOW_DISABLE_NAVBAR := 0

# other stuff
OF_HIDE_NOTCH := 1
OF_CLOCK_POS := 1
OF_CLASSIC_LEDS_FUNCTION := 1
#OF_USE_LZMA_COMPRESSION := 1
OF_USE_GREEN_LED := 0

# OrangeFox settings
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
OF_ENABLE_LPTOOLS := 1

# Maximum permissible splash image size (in kilobytes); do *NOT* increase
OF_SPLASH_MAX_SIZE := 130

OF_ADVANCED_SECURITY := 1
OF_NO_RELOAD_AFTER_DECRYPTION := 1

# keymaster
OF_DEFAULT_KEYMASTER_VERSION := 3.0

# dynamic partitions?
ifeq ($(FOX_USE_DYNAMIC_PARTITIONS),1)
   # build all the partition tools
   OF_ENABLE_ALL_PARTITION_TOOLS := 1
   #
   OF_QUICK_BACKUP_LIST := /boot;/data;
   OF_DISABLE_OTA_MENU := 1
   OF_NO_ADDITIONAL_MIUI_PROPS_CHECK := 1
   OF_SUPPORT_ALL_BLOCK_OTA_UPDATES :=
   OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR :=
else
   OF_QUICK_BACKUP_LIST := /boot;/data;/system_image;/vendor_image;
   ifeq ($(FOX_USE_KEYMASTER_4),1)
       OF_DISABLE_OTA_MENU := 1
       OF_NO_ADDITIONAL_MIUI_PROPS_CHECK := 1
       OF_SUPPORT_ALL_BLOCK_OTA_UPDATES :=
       OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR :=
   endif
endif
#

# use system (ROM) fingerprint where available
# export OF_USE_SYSTEM_FINGERPRINT := 1

# dispense with the entire OTA menu
OF_DISABLE_OTA_MENU := 1

# encryption stiff
OF_KEEP_FORCED_ENCRYPTION := 1
# OF_DONT_PATCH_ENCRYPTED_DEVICE := 1

# don't save historic logs
OF_DONT_KEEP_LOG_HISTORY := 1

# number of list options before scrollbar creation
OF_OPTIONS_LIST_NUM := 9

# use legacy code for wrong clock issues
OF_USE_LEGACY_TIME_FIXUP := 1

OF_MAINTAINER := ferrpp
