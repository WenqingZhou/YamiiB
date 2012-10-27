//
//  Utility.m
//  YawiiB
//
//  Created by wenqing zhou on 10/25/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (void)redirectNSLog
{
	NSString *logPath = [NSString stringWithFormat:@"%@/%@",[Utility getDocumentDir],@"/log"];
	NSFileManager *fileManager=[NSFileManager defaultManager];
	NSDictionary *fileAttr=[fileManager attributesOfItemAtPath:logPath error:nil];
	long long int fileSize=[[fileAttr objectForKey:NSFileSize] longLongValue];
	if (fileSize>2*1024*1024) {
		NSString *oldLogPath=[NSString stringWithFormat:@"%@/%@",[Utility getDocumentDir],@"/log.old"];
		if ([fileManager fileExistsAtPath:oldLogPath]) {
			[fileManager removeItemAtPath:oldLogPath error:nil];
		}
		[fileManager moveItemAtPath:logPath toPath:oldLogPath error:nil];
	}
	freopen([logPath cStringUsingEncoding:NSUTF8StringEncoding],"a+",stderr);
}

+ (NSString *)getDocumentDir
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	return [paths objectAtIndex:0];
}
@end
