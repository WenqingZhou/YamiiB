//
//  AccountInfoHandler.m
//  YawiiB
//
//  Created by wenqing zhou on 10/25/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import "AccountInfoHandler.h"
#import "Utility.h"
#import "ConstantStrings.h"

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

- (void)updateInfo:(NSMutableDictionary *)newInfo
{
    self._dict=nil;
    self._dict=newInfo;
    NSString *picUrl=[[newInfo objectForKey:@"merchant"] objectForKey:@"url_logo"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[@"http://business.yamii.fi" stringByAppendingString:picUrl]]];
    [request setDownloadDestinationPath:[NSString stringWithFormat:@"%@/%@",[Utility getDocumentDir],@"/info.jpg"]];
    NSMutableDictionary *accountInfo=[self._dict objectForKey:@"merchant"];
    [accountInfo setObject:[NSString stringWithFormat:@"%@/%@",[Utility getDocumentDir],@"/info.jpg"] forKey:ACCOUNT_DICT_URL_LOGO_LOCAL];
    [request setDelegate:self];
    [request startAsynchronous];
    [self write];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"Picture downloaded!");
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"Picture failed to download!");
}

-(NSMutableDictionary *)read
{
	NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self._infoPath])
    {
        NSLog(@"Loading info..");
        return [NSMutableDictionary dictionaryWithContentsOfFile:self._infoPath];
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

- (NSString *)stringForService
{
    return [NSString stringWithFormat:@"hid=%@&key=%@",[_dict objectForKey:ACCOUNT_DICT_HID],[_dict objectForKey:ACCOUNT_DICT_KEY]];
}



@end
