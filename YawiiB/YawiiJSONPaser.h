//
//  YawiiJSONPaser.h
//  YawiiB
//
//  Created by wenqing zhou on 10/25/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"
#import "JSONPaserDelegate.h"

@interface YawiiJSONPaser : NSObject

@property (nonatomic,retain) NSString *response;
@property (nonatomic,retain) NSDictionary *object;
@property (nonatomic,retain) id<JSONPaserDelegate> delegate;

-(YawiiJSONPaser *)initWithResponse:(NSString *)aResponse;
-(void)parse;
@end
