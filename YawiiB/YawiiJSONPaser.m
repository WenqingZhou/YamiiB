//
//  YawiiJSONPaser.m
//  YawiiB
//
//  Created by wenqing zhou on 10/25/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import "YawiiJSONPaser.h"

@implementation YawiiJSONPaser

@synthesize response,object,delegate;

-(YawiiJSONPaser *)initWithResponse:(NSString *)aResponse
{
    if (!self) {
        self=[super init];
    }
    self.response=aResponse;
    return self;
}

-(void)parse
{
    SBJsonParser *parser=[[SBJsonParser alloc] init];
    NSError *error=nil;
    if (self.response) {
        self.object=[parser objectWithString:self.response error:&error];
        if (self.object) {
            [self.delegate successfulToParse:self.object];
        }
        else
        {
            [self.delegate failToPaserWithError:@"Error in parsing response!"];
        }
    }
    else
    {
        
        [self.delegate failToPaserWithError:@"Error in parsing response!"];
    }
    
}

@end
