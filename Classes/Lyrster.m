#import "Lyrster.h"

@implementation Lyrster

+(NSString *)fetchLyricsByTitle:(NSString *)title andArtist:(NSString *)artist {
    NSString *urlStr = [[NSString alloc] initWithFormat:@"http://www.lyrster.com/lyrics/%@-lyrics-%@.html", title, artist];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url =[NSURL URLWithString:urlStr];
    NSString *cont = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
    if ([cont rangeOfString:@"<div id=\"lyrics\">"].location == NSNotFound) {
        return @"";
    }
    @try {
        NSString *newline = [cont stringByReplacingOccurrencesOfString:@"<br />" withString:@"\n"];
        newline = [newline stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
        NSString *start = [newline componentsSeparatedByString:@"<div id=\"lyrics\">"][1];
        NSString *end = [start componentsSeparatedByString:@"</div>"][0];
        if ([end rangeOfString:@"do not have the complete song"].location != NSNotFound)
            return @"";
        return end;
    }
    @catch(id err) {
        return @"";
    }
}

@end
