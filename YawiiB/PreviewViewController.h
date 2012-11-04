//
//  PreviewViewController.h
//  YawiiB
//
//  Created by wenqing zhou on 10/28/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "YawiiServiceDelegate.h"

@interface PreviewViewController : UIViewController <YawiiServiceDelegate>
{
    UIWebView *webView;
    UIScrollView *_scrollView;
    UIButton *sendBtn;
    UIView *contentView;
}


@property (nonatomic,retain)  NSMutableDictionary *_params;

- (PreviewViewController *)initWithParamters:(NSMutableDictionary *)params;
- (void)send;
@end
