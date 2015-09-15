THEOS_DEVICE_IP = localhost -p 2222
ARCHS = armv7 arm64
TARGET = iphone:latest:8.0

include theos/makefiles/common.mk

TWEAK_NAME = lyricformusic
lyricformusic_FILES = Tweak.xm MetroLyrics.m Lyrster.m RequestSenderForQianQianLyrics.m RequestSenderForLyricWiki.m QianQianLyrics.m LyricWiki.m KeyValue_SearchLyrics.m
lyricformusic_PRIVATE_FRAMEWORK = MediaPlayerUI FuseUI
lyricformusic_FRAMEWORK = Foundation ApplicationServices CoreText CoreFoundation MediaPlayer UIKit AVFoundation Celestial CoreGraphics
lyricformusic_LDFLAGS = -lxml2 -lz

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "su mobile -c uicache"
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += lyricformusicpb
include $(THEOS_MAKE_PATH)/aggregate.mk
