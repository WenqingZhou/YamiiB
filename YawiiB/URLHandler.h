//
//  URLHandler.h
//  YawiiB
//
//  Created by wenqing zhou on 10/27/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConstantStrings.h"

@interface URLHandler : NSObject
{
    NSString *baseUrl;
}

+(URLHandler *)sharedURLHandler;
- (NSString *)loginURL:(NSString *)username Password:(NSString *)password;
- (NSString *)newSpecial:(NSDictionary *)params;
@end
