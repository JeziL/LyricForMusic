#import <Preferences/Preferences.h>

@interface LyricForMusicPBListController: PSListController {
}
@end

@implementation LyricForMusicPBListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"LyricForMusicPB" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
