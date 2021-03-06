
LOCAL_PATH:= $(call my-dir)

ifneq (${TARGET_ARCH},arm64)

# libAK8963
include $(CLEAR_VARS)
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE := libAK8963
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES_arm := libAK8963.a
LOCAL_32_BIT_ONLY := true
include $(BUILD_PREBUILT)

# akmd2
include $(CLEAR_VARS)
LOCAL_MULTILIB := 32

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)

LOCAL_SRC_FILES:= \
	AK8963Driver.c \
	DispMessage.c \
	FileIO.c \
	Measure.c \
	misc.c \
	main.c
	# Acc_mma8452.c
	# Acc_dummy.c

LOCAL_CFLAGS += -DPLATFORM_SDK_VERSION=$(PLATFORM_SDK_VERSION)
LOCAL_MODULE := akmd
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_FORCE_STATIC_EXECUTABLE := false
LOCAL_STATIC_LIBRARIES := libAK8963
LOCAL_SHARED_LIBRARIES := libc libm libz libutils libcutils liblog
include $(BUILD_EXECUTABLE)

endif
