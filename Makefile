ARCHS = arm64 armv7
TARGET = iphone:8.1:8.0

include theos/makefiles/common.mk

TWEAK_NAME = lyricformusic
lyricformusic_FILES = Tweak.xm MetroLyrics.m Lyrster.m RequestSenderForQianQianLyrics.m RequestSenderForLyricWiki.m QianQianLyrics.m LyricWiki.m KeyValue_SearchLyrics.m
lyricformusic_PRIVATE_FRAMEWORK = MediaPlayerUI FuseUI
lyricformusic_FRAMEWORK = Celestial  AVFoundation UIKit CoreGraphics Foundation CoreFoundation MediaPlayer ApplicationServices CoreText
lyricformusic_LDFLAGS = -lz -lsqlite3.0 -lxml2

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

SUBPROJECTS += lyricformusicpb
include $(THEOS_MAKE_PATH)/aggregate.mk
