//
//  MetroLyrics.m
//  htmltest
//
//  Created by JL-THU on 15/7/20.
//  Copyright © 2015年 JL-THU. All rights reserved.
//

#import "MetroLyrics.h"

@implementation MetroLyrics

+(NSString *)fetchLyricsByTitle:(NSString *)title andArtist:(NSString *)artist {
    NSString *urlStr = [[[[NSString stringWithFormat:@"http://www.metrolyrics.com/%@-lyrics-%@.html", title, artist] stringByReplacingOccurrencesOfString:@" " withString:@"-"] lowercaseString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSString *cont = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
    if ([cont rangeOfString:@"<div id=\"lyrics-body\">"].location == NSNotFound || [cont rangeOfString:@"Unfortunately, we don't have the lyrics"].location != NSNotFound) {
        return @"";
    }
    @try {
        NSString *newline = [cont stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
        NSString *start = [newline substringFromIndex:[newline rangeOfString:@"<p class='verse'>"].location+17];
        NSString *end = [start componentsSeparatedByString:@"</div>"][0];
        NSString *final = [end stringByReplacingOccurrencesOfString:@"<p class='verse'>" withString:@"\n"];
        NSString *final1 = [final stringByReplacingOccurrencesOfString:@"</p>" withString:@"\n"];
        return final1;
    } @catch (id err) {
        return @"";
    }
}

@end
