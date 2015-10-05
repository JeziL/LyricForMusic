#import "Classes/QianQianLyrics.h"
#import "Classes/LyricWiki.h"
#import "Classes/Lyrster.h"
#import "Classes/MetroLyrics.h"
#import "Classes/MPAVItem.h"
#import <UIKit/UIKit.h>

BOOL _enabled;
BOOL _copyable;
float _textSize;

static void loadPrefs() {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ezi.lyricformusic.plist"];
    if(prefs)
    {
        _enabled = [prefs objectForKey:@"Enabled"] ? [[prefs objectForKey:@"Enabled"] boolValue] : YES;
        _copyable = [prefs objectForKey:@"Copyable"] ? [[prefs objectForKey:@"Copyable"] boolValue] : YES;
        _textSize = [prefs objectForKey:@"TextSize"] ? [[prefs objectForKey:@"TextSize"] floatValue] : 17.0;
    }
    [prefs release];
}

BOOL isStringHaveChineseCharacters(NSString *str) {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
            return true;
    }
    return false;
}

NSString *fetchLyricsByTitleAndArtist(NSString *title, NSString *artist) {
	if (isStringHaveChineseCharacters(title) || isStringHaveChineseCharacters(artist)) {
		NSString *lyric = [QianQianLyrics getLyricsByTitle:title getLyricsByArtist:artist];
		if (![lyric isEqualToString:@""]) {
			return lyric;
		}
		else {
			lyric = [LyricWiki getLyricsByTitle:title getLyricsByArtist:artist];
			if (![lyric isEqualToString:@"Not found"] && ![lyric isEqualToString:@""]) {
				return lyric;
			}
			else {
				lyric = [[NSString alloc] initWithFormat:@"%@\n%@\n[Not Found]", title, artist];
				return lyric;
			}
		}
	}
	else {
		NSString *lyric = [Lyrster fetchLyricsByTitle:title andArtist:artist];
		if (![lyric isEqualToString:@""]) {
				return lyric;
		}
		else {
			lyric = [MetroLyrics fetchLyricsByTitle:title andArtist:artist];
			if (![lyric isEqualToString:@""]) {
				return lyric;
			}
			else {
				lyric = [LyricWiki getLyricsByTitle:title getLyricsByArtist:artist];
				if (![lyric isEqualToString:@"Not found"] && ![lyric isEqualToString:@""]) {
					return lyric;
				}
				else {
					lyric = [[NSString alloc] initWithFormat:@"%@\n%@\n[Not Found]", title, artist];
					return lyric;
				}
			}
		}
	}
}

id _title;
id _artist;
NSString *_titleForAppleMusicItem;
NSString *_artistForAppleMusicItem;

%group AppleMusic

	%hook MusicNowPlayingLyricsViewController

	-(id)textView {
		id origResult = %orig;
		UITextView *lyricsView = origResult;
		lyricsView.selectable = _copyable;
		[lyricsView setFont:[%c(UIFont) systemFontOfSize:_textSize]];
		return lyricsView;
	}

	%end

	%hook MusicNowPlayingItemViewController

	-(id)item {
		id origResult = %orig;
		MPAVItem *avItem = origResult;
		_titleForAppleMusicItem = [avItem mainTitle];
		_artistForAppleMusicItem = [avItem artist];
		return origResult;
	}

	%end

	%hook MPAVItem

	-(BOOL)hasDisplayableText {
		return true;
	}

	-(NSString *)lyrics {
		return fetchLyricsByTitleAndArtist(_titleForAppleMusicItem, _artistForAppleMusicItem);
	}

	%end

%end

%group LocalMusic

	%hook MPMediaQueryNowPlayingItem

	-(id)mainTitle {
		id title = %orig;
		_title = title;
		return title;
	}

	-(id)artist {
		id artist = %orig;
		_artist = artist;
		return artist;
	}

	-(id)displayableText {
		NSString *lyric = fetchLyricsByTitleAndArtist(_title, _artist);
		id result = lyric;
		return result;
	}

	%end

%end

%ctor {
	loadPrefs();
	if (_enabled) {
		%init(LocalMusic);
		%init(AppleMusic);
	}
}
