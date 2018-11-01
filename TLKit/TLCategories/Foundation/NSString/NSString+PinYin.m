//
//  NSString+PinYin.m
//  WhichBank
//
//  Created by libokun on 15/9/8.
//  Copyright (c) 2015年 lettai. All rights reserved.
//

#import "NSString+PinYin.h"

@implementation NSString (PinYin)

- (NSString *)pinyin
{
    NSMutableString *str = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)pinyinInitial
{
    if (self.length == 0) {
        return nil;
    }
    NSMutableString *str = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    
    NSArray *words = [str componentsSeparatedByString:@" "];
    NSMutableString *initial = [[NSMutableString alloc] initWithCapacity:words.count];
    for (NSString *word in words) {
        if (word.length > 0) {
            [initial appendString:[word substringToIndex:1]];
        }
    }
    
    return initial;
}


@end
