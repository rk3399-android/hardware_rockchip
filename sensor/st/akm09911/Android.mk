LOCAL_PATH:= $(call my-dir)

ifneq (${TARGET_ARCH},arm64)

include $(CLEAR_VARS)

LOCAL_MULTILIB := 32

LOCAL_CFLAGS += \
	-Wno-unused-parameter

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)

LOCAL_SRC_FILES:= \
	AKMD_Driver.c \
	DispMessage.c \
	FileIO.c \
	Measure.c \
	main.c \
	misc.c \
	Acc_mma8452.c

LOCAL_MODULE  := akmd
LOCAL_PROPRIETARY_MODULE := true
LOCAL_SRC_FILES += FST_AK09911.c
LOCAL_CFLAGS  += -DAKMD_FOR_AK09911
#LOCAL_LDFLAGS += -L$(LOCAL_PATH)/$(SMARTCOMPASS_LIB) -lAK09911
LOCAL_STATIC_LIBRARIES := libAK09911

LOCAL_CFLAGS += -Wall -Wextra
#LOCAL_CFLAGS += -DENABLE_AKMDEBUG=1
#LOCAL_CFLAGS += -DAKM_LOG_ENABLE

LOCAL_MODULE_TAGS := optional
LOCAL_FORCE_STATIC_EXECUTABLE := false
LOCAL_SHARED_LIBRARIES := libc libm libutils libcutils liblog
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE := libAK09911
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES_arm := libAK09911.a
LOCAL_32_BIT_ONLY := true
include $(BUILD_PREBUILT)

endif
