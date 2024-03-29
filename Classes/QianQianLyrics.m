//  QianQianLyrics.m

#import "QianQianLyrics.h"
#import "RequestSenderForQianQianLyrics.h"
#import "KeyValue_SearchLyrics.h"

NSString *lrc2txt (NSString *lrc) {
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"0123456789[]:."];
    NSString *txt = [[lrc componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
    return txt;
}

@implementation QianQianLyrics


FOUNDATION_STATIC_INLINE char SingleDecToHex(int dec)
{
    dec = dec % 16;
    if(dec < 10)
    {
        return (char)(dec+'0');
    }
    char arr[6]={'A','B','C','D','E','F'};
    return arr[dec-10];
}
FOUNDATION_STATIC_INLINE long Conv(long i)
{
    long r = i % 0x100000000;
    if (i >= 0 && r > 0x80000000)
        r = r - 0x100000000;
    
    if (i < 0 && r < 0x80000000)
        r = r + 0x100000000;
    return r;
}
FOUNDATION_STATIC_INLINE NSString *ttpCode(NSString *artist, NSString *title, long lrcId)
{
    
    const char *bytes=[[artist stringByAppendingString:title] cStringUsingEncoding:NSUTF8StringEncoding];
    long len= strlen(bytes);
    int *song = (int*)malloc(sizeof(int)*len);
    for (int i = 0; i < len; i++)
        song[i] = bytes[i] & 0xff;
    
    long intVal1 = 0, intVal2 = 0, intVal3 = 0;
    intVal1 = (lrcId & 0x0000FF00) >> 8;
    if ((lrcId & 0xFF0000) == 0) {
        intVal3 = 0xFF & ~intVal1;
    } else {
        intVal3 = 0xFF & ((lrcId & 0x00FF0000) >> 16);
    }
    intVal3 = intVal3 | ((0xFF & lrcId) << 8);
    intVal3 = intVal3 << 8;
    intVal3 = intVal3 | (0xFF & intVal1);
    intVal3 = intVal3 << 8;
    if ((lrcId & 0xFF000000) == 0) {
        intVal3 = intVal3 | (0xFF & (~lrcId));
    } else {
        intVal3 = intVal3 | (0xFF & (lrcId >> 24));
    }
    long uBound = len - 1;
    while (uBound >= 0) {
        int c = song[uBound];
        if (c >= 0x80)
            c = c - 0x100;
        intVal1 = (c + intVal2) & 0x00000000FFFFFFFF;
        intVal2 = (intVal2 << (uBound % 2 + 4)) & 0x00000000FFFFFFFF;
        intVal2 = (intVal1 + intVal2) & 0x00000000FFFFFFFF;
        uBound -= 1;
    }
    uBound = 0;
    intVal1 = 0;
    while (uBound <= len - 1) {
        long c = song[uBound];
        if (c >= 128)
            c = c - 256;
        long intVal4 = (c + intVal1) & 0x00000000FFFFFFFF;
        intVal1 = (intVal1 << (uBound % 2 + 3)) & 0x00000000FFFFFFFF;
        intVal1 = (intVal1 + intVal4) & 0x00000000FFFFFFFF;
        uBound += 1;
    }
    long intVal5 = Conv(intVal2 ^ intVal3);
    intVal5 = Conv(intVal5 + (intVal1 | lrcId));
    intVal5 = Conv(intVal5 * (intVal1 | intVal3));
    intVal5 = Conv(intVal5 * (intVal2 ^ lrcId));
    
    long intVal6 = intVal5;
    if (intVal6 > 0x80000000) intVal5 = intVal6 - 0x100000000;
    
    //return [[[NSString stringWithFormat:@"%ld",intVal5] retain] autorelease];
    return [NSString stringWithFormat:@"%ld",intVal5];
}

FOUNDATION_STATIC_INLINE NSMutableString* SetToHexString(NSString *str)
{
    
    const char *s = [str cStringUsingEncoding:NSUnicodeStringEncoding];
    NSMutableString *result = [NSMutableString string];
    
    if(!s) return NULL;
    int j = 0;
    int n= (int)[str lengthOfBytesUsingEncoding:NSUnicodeStringEncoding];
    for(int i=0; i<n; i++)
    {
        unsigned ord=(unsigned)s[i];
        if (j+2>1022)
        {
            return NULL;
        }
        
        [result appendFormat:@"%c%c",SingleDecToHex((ord-ord%16)/16),SingleDecToHex(ord%16)];
        
    }
    return result;
}

+(NSString*)getLyricsByTitle:(NSString *)Title getLyricsByArtist:(NSString *)Artist
{
    @try {
        NSArray *CharToDelete = [NSArray arrayWithObjects:@",",@".",@"'",@"\"",@" ", @"`", @"~", @"!", @"@", @"#", @"$", @"%", @"^", @"&", @"*", @"(", @")", @"-", @"_", @"=", @"+", @", @", @"<", @".", @">", @"/", @"?", @";", @":", @"\"", @"[", @"{", @"]", @"}", @"\\", @"|", @"€",@"　", @"。", @"，", @"、", @"；", @"：", @"？", @"！", @"…", @"—", @"·",@"ˉ", @"¨", @"‘", @"’", @"“", @"”", @"々", @"～", @"‖", @"∶", @"＂", @"＇",@"｀", @"｜", @"〃", @"〔", @"〕", @"〈", @"〉", @"《", @"》", @"「", @"」",@"『", @"』", @"．", @"〖", @"〗", @"【", @"】", @"（", @"）", @"［", @"］",@"｛", @"｝", @"≈", @"≡", @"≠", @"＝", @"≤", @"≥", @"＜", @"＞", @"≮", @"≯", @"∷", @"±",@"＋", @"－", @"×", @"÷", @"／", @"∫", @"∮", @"∝", @"∞", @"∧", @"∨", @"∑", @"∏", @"∪",@"∩", @"∈", @"∵", @"∴", @"⊥", @"∥", @"∠", @"⌒", @"⊙", @"≌", @"∽", @"√", @"§", @"№",@"☆", @"★", @"○", @"●", @"◎", @"◇", @"◆", @"□", @"℃", @"‰", @"■", @"△", @"▲", @"※", @"→",@"←", @"↑", @"↓", @"〓", @"¤", @"°", @"＃", @"＆", @"＠", @"＼", @"︿", @"＿", @"￣", @"―",@"♂", @"♀", @"Ⅰ", @"Ⅱ", @"Ⅲ", @"Ⅳ", @"Ⅴ", @"Ⅵ", @"Ⅶ", @"Ⅷ", @"Ⅸ", @"Ⅹ", @"Ⅺ",@"Ⅻ", @"⒈", @"⒉", @"⒊", @"⒋", @"⒌", @"⒍", @"⒎", @"⒏", @"⒐", @"⒑", @"⒒", @"⒓",@"⒔", @"⒕", @"⒖", @"⒗", @"⒘", @"⒙", @"⒚", @"⒛", @"㈠", @"㈡", @"㈢", @"㈣", @"㈤",@"㈥", @"㈦", @"㈧", @"㈨", @"㈩", @"①", @"②", @"③", @"④", @"⑤", @"⑥", @"⑦", @"⑧", @"⑨", @"⑩",@"⑴", @"⑵", @"⑶", @"⑷", @"⑸", @"⑹", @"⑺", @"⑻", @"⑼", @"⑽", @"⑾", @"⑿", @"⒀",@"⒁", @"⒂", @"⒃", @"⒄", @"⒅", @"⒆", @"⒇", @"┌", @"┍", @"┎", @"┏", @"┐", @"┑", @"┒",@"┓", @"─", @"┄", @"┈", @"└", @"┕", @"┖", @"┗", @"┘", @"┙", @"┚", @"┛", @"━", @"┅", @"┉",@"├", @"┝", @"┞", @"┟", @"┠", @"┡", @"┢", @"┣", @"│", @"┆", @"┊", @"┤", @"┥", @"┦", @"┧", @"┨",@"┩", @"┪", @"┫", @"┃", @"┇", @"┋", @"┬", @"┭", @"┮", @"┯", @"┰", @"┱", @"┲", @"┳", @"┴", @"┵",@"┶", @"┷", @"┸", @"┹", @"┺", @"┻", @"┼", @"┽", @"┾", @"┿", @"╀", @"╁", @"╂", @"╃", @"╄", @"╅",@"╆", @"╇", @"╈", @"╉", @"╊", @"╋", nil];
        
        NSMutableString *_Title = [NSMutableString stringWithString: [Title stringByReplacingOccurrencesOfString:@" " withString:@""]];
        for (int i =0; i < [CharToDelete count]; i++)
            [_Title setString:[_Title stringByReplacingOccurrencesOfString:[NSString stringWithString:[CharToDelete objectAtIndex:i]] withString:@""]];
        
        [_Title setString:[_Title lowercaseString]];
        
        NSMutableString *_Artist = [NSMutableString stringWithString:[Artist stringByReplacingOccurrencesOfString:@" " withString:@""]];
        for (int i =0; i < 32; i++)
            [_Artist setString:[_Artist stringByReplacingOccurrencesOfString:[NSString stringWithString:[CharToDelete objectAtIndex:i]] withString:@""]];
        
        [_Artist setString:[_Artist lowercaseString]];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *url;
        if ([userDefaults integerForKey:@"LyricsServer"] == 0)
        {
            url = [NSString stringWithFormat:@"http://ttlrccnc.qianqian.com/dll/lyricsvr.dll?sh?Artist=%@&Title=%@&Flags=0",SetToHexString(_Artist),SetToHexString(_Title)];
        }
        else
        {
            url = [NSString stringWithFormat:@"http://ttlrcct.qianqian.com/dll/lyricsvr.dll?sh?Artist=%@&Title=%@&Flags=0",SetToHexString(_Artist),SetToHexString(_Title)];
        }
        
        NSString *result = [RequestSenderForQianQianLyrics sendRequest:url];
        NSArray *tempArray = [result componentsSeparatedByString:@"<lrc"];
        
        
        
        int finalTextIndex = -1;
        for (int i = 1; i<[tempArray count]; i++)
        {
            NSString *r = [NSString stringWithString:[tempArray objectAtIndex:i]];
            
            NSString *artist = [r substringFromIndex:[r rangeOfString:@"artist=\""].location + 8];
            artist = [artist substringToIndex:[artist rangeOfString:@"\" title"].location];
            
            
            if (finalTextIndex == -1 || [artist rangeOfString:@"中"].location != NSNotFound || [artist rangeOfString:@"双"].location != NSNotFound || [artist rangeOfString:@"对照"].location != NSNotFound)
            {
                finalTextIndex = i;
            }
        }
        if (finalTextIndex == -1)
        {
            return @"";
        }
        
        NSString *r = [NSString stringWithString:[tempArray objectAtIndex:finalTextIndex]];
        
        NSString *lrcID = [r substringFromIndex:[r rangeOfString:@"id=\""].location + 4];
        lrcID = [lrcID substringToIndex:[lrcID rangeOfString:@"\" arti"].location];
        
        NSString *finalArtist = [r substringFromIndex:[r rangeOfString:@"artist=\""].location + 8];
        finalArtist = [finalArtist substringToIndex:[finalArtist rangeOfString:@"\" title"].location];
        
        NSString *finalTitle = [r substringFromIndex:[r rangeOfString:@"title=\""].location + 7];
        finalTitle = [finalTitle substringToIndex:[finalTitle rangeOfString:@"\"></lrc"].location];
        
        long finalId = [lrcID intValue];
        finalTitle = [finalTitle stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
        finalArtist = [finalArtist stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
        finalTitle = [finalTitle stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
        finalArtist = [finalArtist stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
        finalTitle = [finalTitle stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
        finalArtist = [finalArtist stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
        
        
        NSString *finalCode = ttpCode(finalArtist, finalTitle, finalId);
        NSString *finalUrl;
        if ([userDefaults integerForKey:@"LyricsServer"] == 0)
        {
            finalUrl = [NSString stringWithFormat:@"http://ttlrccnc.qianqian.com/dll/lyricsvr.dll?dl?Id=%lu&Code=%@",finalId,finalCode];
        }
        else
        {
            finalUrl = [NSString stringWithFormat:@"http://ttlrcct.qianqian.com/dll/lyricsvr.dll?dl?Id=%lu&Code=%@",finalId,finalCode];
        }
        
        NSString *finalResult = [RequestSenderForQianQianLyrics sendRequest:finalUrl];
        NSString *finalResultInTxt = lrc2txt(finalResult);
        return finalResultInTxt;
    }
    @catch (NSException *exception) {
        return @"";
    }
    
}

@end