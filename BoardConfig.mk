-include vendor/samsung/lt023g/BoardConfigVendor.mk

LOCAL_PATH := device/samsung/lt023g

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

#Target info
ARCH_ARM_HAVE_TLS_REGISTER := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Not Yet
#TARGET_BOARD_INFO_FILE := $(LOCAL_PATH)/board-info.txt

#cflags
LOCAL_CFLAGS += -DMRVL_HARDWARE
LOCAL_CFLAGS += -DNO_RGBX_8888
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
LOCAL_CFLAGS += -DBOARD_EGL_NEEDS_LEGACY_FB
LOCAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
LOCAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR1_AUDIO_BLOB

TARGET_BOARD_PLATFORM := mrvl

# CPU
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true

#BOOTLOADER
TARGET_BOOTLOADER_BOARD_NAME := PXA988

# Flags (removed, shifted to vendor files. INCLUDE_MARVELL_FLAGS present in vendor )
INCLUDE_MARVELL_FLAGS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# MRVL hardware
BOARD_USES_MRVL_HARDWARE := true

# Kernel
#BOARD_KERNEL_CMDLINE := androidboot.hardware=pxa988 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x10000000
TARGET_KERNEL_ARCH := arm
BOARD_MKBOOTIMG_ARGS := \
	--ramdisk_offset 0x01000000 \
	--pagesize 2048 \
	--board MRVL
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.7/bin
TARGET_KERNEL_SOURCE := kernel/samsung/lt02
TARGET_KERNEL_CONFIG := pxa986_lt023g_SscSPs_defconfig
#TARGET_KERNEL_VARIANT_CONFIG := pxa986_lt023g_SscSPs_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# build old-style zip files (required for ota updater)
BLOCK_BASED_OTA := false

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1507852288
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5775556608
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_UMS_LUNFILE := "/sys/class/android_usb/f_mass_storage/lun0/file"
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true

# Recovery
LZMA_RAMDISK_TARGETS := recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.pxa988
RECOVERY_FSTAB_VERSION := 2
BOARD_RECOVERY_SWIPE := true
#TARGET_RECOVERY_DEVICE_DIRS += $(LOCAL_PATH)
#TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/rootdir/init.pxa988.rc

# Display
VSYNC_EVENT_PHASE_OFFSET_NS := 0
BOARD_HAVE_PIXEL_FORMAT_INFO := true
BOARD_USE_BGRA_8888 := true
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
#COMMON_GLOBAL_FLAGS += -DSK_SUPPORT_LEGACY_SETCONFIG
BOARD_ENABLE_MULTI_DISPLAYS := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Charger
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_CHARGER_SHOW_PERCENTAGE := true
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"
BOARD_NO_CHARGER_LED := true
#BOARD_CHARGER_RES := $(LOCAL_PATH)/res/charger

# Audio
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true

# RIL (will add later)
#BOARD_PROVIDES_RILD := true
#BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril
#BOARD_CONNECTIVITY_MODULE := conn_soc

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += $(LOCAL_PATH)/cmhw

# WiFi
BOARD_HAVE_MARVELL_WIFI := true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mrvl
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mrvl
BOARD_WLAN_DEVICE := mrvl
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/sd8xxx/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/mrvl/sd8787_uapsta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/mrvl/sd8787_uapsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/firmware/mrvl/sd8787_uapsta.bin"
CONFIG_CTRL_IFACE := true
MRVL_WIRELESS_DAEMON_API := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MRVL := true
MRVL_WIRELESS_DAEMON_API := true
USE_BLUETOOTH_SAP := false

# GPS (To be added later)
#BOARD_GPS_LIBRARIES := true
#BOARD_MRVL_USES_GPS := true

# system.prop
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Camera
USE_CAMERA_STUB := true
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_TS_MAKEUP := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 17
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun%d/file"

# Webkit
ENABLE_WEBGL := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_NEEDS_CUTILS_LOG := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
BOARD_USES_HWCOMPOSER := true
#TARGET_FORCE_CPU_UPLOAD := true

#Generic config
MRVL_ION := true

# The above lines are almost the same as Brownstone.
# MMP3 Special
BOARD_USE_VIVANTE_GRALLOC := true
HDMI_SUPPORT_3D := true

#BOARD_GFX_DRIVER_VERSION=4x

#Enable marvell interface in SurfaceFlinger
MRVL_INTERFACE_ANIMATION := true
#ENABLE_HWC_GC_PATH := true

#Launch DMS in SurfaceFlinger process
MRVL_LAUNCH_DMS_IN_SURFACEFLINGER := true

TARGET_FORCE_CPU_UPLOAD := true

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/lt023g/sepolicy

# Sec_touchscreen
INPUT_TOUCH_DRIVER := TOUCH_LT

# Compatibility with pre-kitkat Sensor HALs
SENSORS_NEED_SETRATE_ON_ENABLE := true

##
## Extras
##

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Malloc
MALLOC_SVELTE := true

# bootcharting
INIT_BOOTCHART := true

# MRVL
BOARD_USES_MARVELL_HWC_ENHANCEMENT := true
#COMMON_GLOBAL_CFLAGS += -DMARVELL_HWC_ENHANCEMENT

#TWRP
ifeq ($(WITH_TWRP),true)
-include $(LOCAL_PATH)/twrp.mk
endif
