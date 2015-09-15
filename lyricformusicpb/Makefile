include theos/makefiles/common.mk

BUNDLE_NAME = LyricForMusicPB
LyricForMusicPB_FILES = LyricForMusicPB.mm
LyricForMusicPB_INSTALL_PATH = /Library/PreferenceBundles
LyricForMusicPB_FRAMEWORKS = UIKit
LyricForMusicPB_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LyricForMusicPB.plist$(ECHO_END)
