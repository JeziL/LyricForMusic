//  RequestSenderForLyricWiki.m

#import "RequestSenderForLyricWiki.h"


@implementation RequestSenderForLyricWiki

+ (NSData*)fetchRequest:(NSString*)url
{
    NSString *urlString = url;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
    NSHTTPURLResponse* urlResponse = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:NULL];
    return responseData;
}

@end