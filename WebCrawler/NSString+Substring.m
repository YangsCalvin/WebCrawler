//
//  NSString+Substring.m
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import "NSString+Substring.h"

@implementation NSString (Substring)
/**
 获得特定字符串的中字符串
 
 @param strLeft: 左边匹配字符串
 
 @param strRight: 右边匹配的字符串
 
 @return NSString类型
 */
- (NSString*)substringWithinBoundsLeft:(NSString*)strLeft right:(NSString*)strRight
{
    NSRange rangeSub;
    NSString *strSub;
    
    NSRange range;
    range = [self rangeOfString:strLeft options:0];
    
    if (range.location == NSNotFound) {
        return nil;
    }
    
    rangeSub.location = range.location + range.length;
    
    range.location = rangeSub.location;
    range.length = [self length] - range.location;
    range = [self rangeOfString:strRight options:0 range:range];
    
    if (range.location == NSNotFound) {
        return nil;
    }
    
    rangeSub.length = range.location - rangeSub.location;
    strSub = [[self substringWithRange:rangeSub] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return strSub;
}
@end
