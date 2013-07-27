LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# ucd-tools wide-character compatibility support:

UCDTOOLS_SRC_PATH  := ../../ucd-tools/src
UCDTOOLS_SRC_FILES := \
  $(subst $(LOCAL_PATH)/$(UCDTOOLS_SRC_PATH),$(UCDTOOLS_SRC_PATH),$(wildcard $(LOCAL_PATH)/$(UCDTOOLS_SRC_PATH)/*.c*))

LOCAL_SRC_FILES += $(UCDTOOLS_SRC_FILES)

# eSpeak (minus command line apps and espeakedit)

BLACKLIST_SRC_FILES := \
  %/compiledata.cpp \
  %/espeak.cpp \
  %/espeakedit.cpp \
  %/extras.cpp \
  %/formantdlg.cpp \
  %/menus.cpp \
  %/options.cpp \
  %/prosodydisplay.cpp \
  %/speak.cpp \
  %/spect.cpp \
  %/spectdisplay.cpp \
  %/spectseq.cpp \
  %/transldlg.cpp \
  %/voicedlg.cpp \
  %/vowelchart.cpp

ESPEAK_SRC_PATH  := ../../src
ESPEAK_SRC_FILES := \
  $(subst $(LOCAL_PATH)/$(ESPEAK_SRC_PATH),$(ESPEAK_SRC_PATH),$(wildcard $(LOCAL_PATH)/$(ESPEAK_SRC_PATH)/*.c*))

LOCAL_SRC_FILES += \
  $(filter-out $(BLACKLIST_SRC_FILES),$(ESPEAK_SRC_FILES))

# JNI

LOCAL_SRC_FILES += \
  $(subst $(LOCAL_PATH)/jni,jni,$(wildcard $(LOCAL_PATH)/jni/*.c*))

# Common

LOCAL_C_INCLUDES += \
  $(LOCAL_PATH)/include \
  $(LOCAL_PATH)/$(UCDTOOLS_SRC_PATH)/include \
  $(LOCAL_PATH)/$(ESPEAK_SRC_PATH)

LOCAL_LDLIBS := \
  -llog

LOCAL_MODULE := libttsespeak
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)