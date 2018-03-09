//
//  NSString+Substring.h
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2018年 yangziyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Substring)
/**
 获得特定字符串的中字符串
 
 @param strLeft 左边匹配字符串
 
 @param strRight 右边匹配的字符串
 
 @return NSString类型
 */
- (NSString*)substringWithinBoundsLeft:(NSString*)strLeft right:(NSString*)strRight;
@end
