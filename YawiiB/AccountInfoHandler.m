//
//  AccountInfoHandler.m
//  YawiiB
//
//  Created by wenqing zhou on 10/25/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import "AccountInfoHandler.h"
#import "Utility.h"

static AccountInfoHandler *_handler;

@implementation AccountInfoHandler

@synthesize _dict,_infoPath;

+(AccountInfoHandler *)sharedAccountHandler
{
    if (!_handler)
    {
        _handler=[[AccountInfoHandler alloc] init];
        _handler._infoPath=[NSString stringWithFormat:@"%@/%@",[Utility getDocumentDir],@"/info"];
        _handler._dict=[_handler read];
    }
    return _handler;
}

- (void)updateInfo:(NSDictionary *)newInfo
{
    self._dict=nil;
    self._dict=newInfo;
    [self write];
    NSString *picUrl=[[newInfo objectForKey:@"merchant"] objectForKey:@"url_logo"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[@"http://business.yamii.fi" stringByAppendingString:picUrl]]];
    [request setDownloadDestinationPath:[NSString stringWithFormat:@"%@/%@",[Utility getDocumentDir],@"/info.jpg"]];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"Picture downloaded!");
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"Picture failed to download!");
}

-(NSDictionary *)read
{
	NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self._infoPath])
    {
        NSLog(@"Loading info..");
        return [NSDictionary dictionaryWithContentsOfFile:self._infoPath];
    }
    else
    {
        return nil;
    }
}

-(BOOL)write
{
	NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self._infoPath])
    {
        NSLog(@"Overwrite info..");
        return [self._dict writeToFile:self._infoPath atomically:YES];
    }
    else
    {
        NSLog(@"Initialize info..");
        return [self._dict writeToFile:self._infoPath atomically:YES];
    }
}

@end
