# config.mk
#
# Product-specific compile-time definitions
#


BOARD_VENDOR := htc
DEVICE_PATH := device/htc/ocl

# Architecture
TARGET_BOARD_PLATFORM := sdm660

TARGET_USES_AOSP := true
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_USES_UEFI := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := SDM660

-include $(QCPATH)/common/sdm660/BoardConfigVendor.mk

TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4009754624
BOARD_USERDATAIMAGE_PARTITION_SIZE := 16719544320
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
ifneq ($(TARGET_USES_AOSP),true)
TARGET_USES_QCOM_BSP := true
endif

BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 user_debug=31 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 swiotlb=1 androidboot.configfs=true androidboot.usbcontroller=a800000.dwc3 androidboot.hardware=htc_ocl androidkey.dummy=1 buildvariant=eng androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --second_offset 0x00f00000 --tags_offset 0x00000100 --board boot:0

TARGET_PREBUILT_KERNEL := device/htc/ocl/prebuilts/kernel
TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

#TARGET_PLATFORM_DEVICE_BASE := /devices/soc/

#Enable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Lineage Hardware
JAVA_SOURCE_OVERLAYS := org.lineageos.hardware|$(DEVICE_PATH)/lineagehw|**/*.java

# Security patch level
VENDOR_SECURITY_PATCH := 2020-09-01

-include device/htc/ocl/BoardConfigTWRP.mk
-include vendor/htc/ocl/BoardConfigVendor.mk


AB_OTA_UPDATER := true
