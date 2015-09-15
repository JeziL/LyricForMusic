#import <Preferences/Preferences.h>
#define donateURL @"http://ezidev.tumblr.com/post/124997910493/donation"
#define myTwitterWeb @"https://twitter.com/EZIdev"
#define myTwitterApp @"twitter:///user?screen_name=EZIdev"

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

-(void)donate {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:donateURL]];
}

-(void)twitter {
	 NSURL *myTwitterUrlScheme = [NSURL URLWithString:myTwitterApp];
    if ([[UIApplication sharedApplication] canOpenURL:myTwitterUrlScheme])
        [[UIApplication sharedApplication] openURL:myTwitterUrlScheme];
    else
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:myTwitterWeb]];
}

@end

// vim:ft=objc
