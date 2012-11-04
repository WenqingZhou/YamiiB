//
//  LanguageBundle.m
//  YawiiB
//
//  Created by wenqing zhou on 10/27/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import "SystemSetting.h"

static SystemSetting *_systemSetting;

@implementation SystemSetting

@synthesize localeBundle;

+(SystemSetting *)sharedLanguageBundle
{
    if (!_systemSetting) {
        _systemSetting=[[SystemSetting alloc] init];
    }
    return _systemSetting;
}

-(SystemSetting *)init
{
    self=[super init];
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    if (path) {
        localeBundle = [NSBundle bundleWithPath:path];
    }
    return self;
}

@end
