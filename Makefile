ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

DEBUG = 0
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME := afc2dService
afc2dService_FILES += afc2dService.xm
afc2dService_CFLAGS += -fobjc-arc
afc2dService_CFLAGS += -DJB_PREFIX=\"/var/jb\"
afc2dService_LIBRARIES += substrate

include $(THEOS_MAKE_PATH)/tweak.mk