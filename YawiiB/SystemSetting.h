//
//  LanguageBundle.h
//  YawiiB
//
//  Created by wenqing zhou on 10/27/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemSetting : NSObject
{
    NSBundle *localeBundle;
}

@property (nonatomic,retain) NSBundle *localeBundle;
+(SystemSetting *)sharedLanguageBundle;
-(SystemSetting *)init;
@end
