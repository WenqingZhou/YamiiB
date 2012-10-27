//
//  AccountInfoHandler.h
//  YawiiB
//
//  Created by wenqing zhou on 10/25/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@interface AccountInfoHandler : NSObject <ASIHTTPRequestDelegate>

@property (nonatomic,retain) NSDictionary *_dict;
@property (nonatomic,retain) NSString *_infoPath;
+(AccountInfoHandler *)sharedAccountHandler;
- (void)updateInfo:(NSDictionary *)newInfo;
-(NSDictionary *)read;
-(BOOL)write;


@end
