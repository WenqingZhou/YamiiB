//
//  NSDate+formatString.m
//  YawiiB
//
//  Created by wenqing zhou on 10/29/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import "NSDate+formatString.h"

@implementation NSDate (formatString)

- (NSString *)getYear
{
    NSDateFormatter *df=[[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy"];
    NSString *yearString=[df stringFromDate:self];
    [df release];
    return yearString;
}

@end
