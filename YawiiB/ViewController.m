//
//  ViewController.m
//  YawiiB
//
//  Created by wenqing zhou on 10/25/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import "ViewController.h"
#import "AccountInfoHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"data:%@",[[AccountInfoHandler sharedAccountHandler] _dict]);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)grabURL:(id)sender
{
    YawiiServiceHandler *handler=[[YawiiServiceHandler alloc] init];
    handler.delegate=self;
    MBProgressHUD *progressView=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [progressView setMode:MBProgressHUDModeIndeterminate];
    [progressView setAnimationType:MBProgressHUDAnimationFade];
    [progressView setLabelText:@"Connecting..."];
    [progressView showAnimated:YES whileExecutingBlock:^(void) {
        NSString *urlStr=@"http://business.yamii.fi/api/default/login?email=ios_tester1@yamii.fi&pass=098f6bcd4621d373cade4e832627b4f6&lang=en_gb";
        [handler requestForUrl:[NSURL URLWithString:urlStr]];
    }];
}

#pragma LoginDelegate methods

- (void)successfulToRequest:(NSDictionary *)response
{
    long long int responseCode=[[response objectForKey:@"code"] longLongValue];
    switch (responseCode) {
        case 200:
        {
            NSDictionary *infoDict=[response objectForKey:@"message"];
            [[AccountInfoHandler sharedAccountHandler] updateInfo:infoDict];
            break;
        }
        case 500:
            NSLog(@"Wrong password/username");
        default:
            break;
    }
}
- (void)failToRequestWithError:(NSString *)errorStr
{
    NSLog(@"error:%@",errorStr);
}


@end
