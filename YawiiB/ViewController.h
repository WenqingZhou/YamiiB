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
#import "AZUITextField.h"
#import "URLHandler.h"
#import "AddSpecialViewController.h"

@interface ViewController : UIViewController <YawiiServiceDelegate,UITextFieldDelegate>
{
    IBOutlet UIButton *loginBtn;
    IBOutlet UIImageView *logoImageView;
    IBOutlet UILabel *yawiiLabel;
    IBOutlet UILabel *businessLabel;
    IBOutlet UILabel *sloganLabel;
    IBOutlet AZUITextField *usernameTF;
    IBOutlet AZUITextField *passwordTF;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UILabel *tradeMark;
    IBOutlet UIButton *forgetPasswordBtn;
    
}

@end
