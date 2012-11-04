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

@property (nonatomic,retain) NSMutableDictionary *_dict;
@property (nonatomic,retain) NSString *_infoPath;
+(AccountInfoHandler *)sharedAccountHandler;
- (void)updateInfo:(NSMutableDictionary *)newInfo;
-(NSMutableDictionary *)read;
-(BOOL)write;

-(NSString *)stringForService;


@end
