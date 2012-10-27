//
//  YawiiServiceHandler.h
//  YawiiB
//
//  Created by wenqing zhou on 10/25/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "YawiiJSONPaser.h"
#import "YawiiServiceDelegate.h"

@interface YawiiServiceHandler : NSObject<JSONPaserDelegate>

@property (nonatomic,retain) id<YawiiServiceDelegate> delegate;

-(void)requestForUrl:(NSURL *)url;

@end
