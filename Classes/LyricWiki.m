//LyricWiki.m

#import "LyricWiki.h"
#import "RequestSenderForLyricWiki.h"

NSString *json2txt (NSString *json) {
    NSRange range;
    NSInteger indexOfFirstLetterInLyrics;
    NSInteger indexOfLastLetterInLyrics;
    range = [json rangeOfString:@"lyrics':'"];
    if (range.location != NSNotFound) {
        indexOfFirstLetterInLyrics = range.location + range.length;
    }else{
        return @"";
    }
    range = [json rangeOfString:@"',\n'url':'"];
    if (range.location != NSNotFound) {
        indexOfLastLetterInLyrics = range.location - 1;
    }else{
        return @"";
    }
    NSRange rangeOfLyrics = NSMakeRange(indexOfFirstLetterInLyrics, indexOfLastLetterInLyrics - indexOfFirstLetterInLyrics + 1);
    NSString *txt = [[[json substringWithRange:rangeOfLyrics] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"] stringByReplacingOccurrencesOfString:@"\\'" withString:@"\'"];
    return txt;
}

@implementation LyricWiki

+(NSString*)getLyricsByTitle:(NSString *)title getLyricsByArtist:(NSString *)artist
{
    NSData *json = [RequestSenderForLyricWiki fetchRequest:[[NSString stringWithFormat:@"http://lyrics.wikia.com/api.php?artist=%@&song=%@&fmt=json", artist, title] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSError* error = nil;
    
    if (json == nil) return @"";
    
    NSString *jsonData = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
    
    if (error) return @"";
    NSString *lyrics = json2txt(jsonData);
    
    
    if (!lyrics) return @"";
    
    return lyrics;
    
}

@end