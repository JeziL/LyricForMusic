ARCHS = arm64 armv7
TARGET = iphone:8.1:8.0

include theos/makefiles/common.mk

BUNDLE_NAME = LyricForMusicPB
LyricForMusicPB_FILES = LyricForMusicPB.mm
LyricForMusicPB_INSTALL_PATH = /Library/PreferenceBundles
PreferenceTestPB_FRAMEWORKS = UIKit CoreGraphics Foundation
PreferenceTestPB_PRIVATE_FRAMEWORKS = Preferences
PreferenceTestPB_LDFLAGS = -lz -lsqlite3.0

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LyricForMusicPB.plist$(ECHO_END)
