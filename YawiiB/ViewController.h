//
//  ViewController.h
//  YawiiB
//
//  Created by wenqing zhou on 10/25/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YawiiServiceHandler.h"
#import "MBProgressHUD.h"
#import "YawiiServiceDelegate.h"

@interface ViewController : UIViewController <YawiiServiceDelegate>
{
    IBOutlet UIButton *connectBtn;
}

@end
