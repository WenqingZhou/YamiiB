//
//  URLHandler.m
//  YawiiB
//
//  Created by wenqing zhou on 10/27/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import "URLHandler.h"
#import "NSString+MD5.h"
#import "AccountInfoHandler.h"
#import "Constant.h"

static URLHandler *_urlHandler;

@implementation URLHandler

+(URLHandler *)sharedURLHandler
{
    if (!_urlHandler) {
        _urlHandler=[[URLHandler alloc] init];
    }
    return _urlHandler;
}

- (URLHandler *)init
{
    self=[super init];
    baseUrl=WEBSERVICE_BASE_URL;
    return self;
}

- (NSString *)loginURL:(NSString *)username Password:(NSString *)password
{
    return [NSString stringWithFormat:@"%@default/login?email=%@&pass=%@&lang=en_gb",baseUrl,username,[password MD5]];
}

- (NSString *)newSpecial:(NSDictionary *)params
{
    NSString *timestamp=[NSString stringWithFormat:@"%.0f",[[params objectForKey:NEWSPECIAL_DICT_VALIDTIME] doubleValue]*1000];
    int max=[[params objectForKey:NEWSPECIAL_DICT_VALIDNUMBER] intValue];
    if (max== MAX_AMOUNT * AMOUNT_INTERVAL
        ||max== MIN_AMOUNT * AMOUNT_INTERVAL)
    {
        max=0;
    }
    NSString *specialParamStr=[NSString stringWithFormat:@"old_price=%@&new_price=%@&end_time=%@&content=%@&nop=%@",
                                  [params objectForKey:NEWSPECIAL_DICT_ORIGINAL],
                                  [params objectForKey:NEWSPECIAL_DICT_CURRENT],
                                  timestamp,
                                  [[params objectForKey:NEWSPECIAL_DICT_CONTENT] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
                                  [NSString stringWithFormat:@"%d",max]
                                  ];
    return [NSString stringWithFormat:@"%@special/sendInstant?%@&%@",baseUrl,[[AccountInfoHandler sharedAccountHandler] stringForService],specialParamStr];
}

-(NSString *)getHidParameter
{
    return [NSString stringWithFormat:@"&"];
}



@end
