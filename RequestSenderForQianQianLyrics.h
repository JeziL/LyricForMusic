//  RequestSenderForQianQianLyrics.h

@interface RequestSenderForQianQianLyrics : NSObject {
    
}

+ (NSString*)sendRequest:(NSString*)url;
+ (NSData*)fetchRequest:(NSString*)url;

@end