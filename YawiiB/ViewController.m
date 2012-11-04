//
//  ViewController.m
//  YawiiB
//
//  Created by wenqing zhou on 10/25/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import "ViewController.h"
#import "AccountInfoHandler.h"
#import <QuartzCore/QuartzCore.h>
#import "SystemSetting.h"
#import "NSDate+formatString.h"
#import "UITextField+Validation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.0 green:115.0/255 blue:177.0/255 alpha:1.0]];
    UIImage *imageForGreenBtn=[[UIImage imageNamed:@"greenButton.png"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    [yawiiLabel setText:NSLocalizedStringWithDefaultValue(@"Yamii", nil, [[SystemSetting sharedLanguageBundle] localeBundle], @"Yamii", @"text for Yamii label")];
    [loginBtn setBackgroundImage:imageForGreenBtn forState:UIControlStateNormal];
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    usernameTF.layer.cornerRadius= 8.0f;
    [usernameTF setPlaceholder:@" Email address"];
    usernameTF.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    usernameTF.layer.masksToBounds=YES;
    usernameTF.layer.borderWidth=1.0f;
    usernameTF.delegate=self;
    
    passwordTF.layer.cornerRadius= 8.0f;
    [passwordTF setPlaceholder:@" password"];
    passwordTF.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    passwordTF.layer.masksToBounds=YES;
    passwordTF.layer.borderWidth=1.0f;
    passwordTF.delegate=self;
    
    tradeMark.text=[NSString stringWithFormat:@"%@@%@",[[NSDate date] getYear],APP_COMPANY];
    
    NSLog(@"data:%@",[[AccountInfoHandler sharedAccountHandler] _dict]);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)forgetPassword:(id)sender
{
    NSString *recipients = [NSString stringWithFormat:@"mailto:admin@yamii.fi?subject=%@",@"Forget my password"];
    
    NSString *body = [NSString stringWithFormat:@"&body=username:%@",usernameTF.text];
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (IBAction)grabURL:(id)sender
{
    if ([usernameTF isValidStringAndFocus:YES] && [passwordTF isValidStringAndFocus:YES]) {
        [usernameTF endEditing:YES];
        [passwordTF endEditing:YES];
        [self recoverUI];
        YawiiServiceHandler *handler=[[YawiiServiceHandler alloc] init];
        handler.delegate=self;
        MBProgressHUD *progressView=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [progressView setMode:MBProgressHUDModeIndeterminate];
        [progressView setAnimationType:MBProgressHUDAnimationFade];
        [progressView setLabelText:@"Connecting..."];
        [progressView showAnimated:YES whileExecutingBlock:^(void) {
            NSString *urlStr=[[URLHandler sharedURLHandler] loginURL:usernameTF.text
                                                            Password:passwordTF.text];
            NSLog(@"urlStr:%@",urlStr);
            [handler requestForUrl:[NSURL URLWithString:urlStr]];
        }];
    }
    /*
    AddSpecialViewController *asvc;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        asvc = [[AddSpecialViewController alloc] initWithNibName:@"AddSpecialViewController_iPhone" bundle:nil];
    } else
    {
        asvc = [[AddSpecialViewController alloc] initWithNibName:@"AddSpecialViewController_iPad" bundle:nil];
    }
    [self.navigationController pushViewController:asvc animated:YES];
    [asvc release];
     */
     
}

#pragma LoginDelegate methods

- (void)successfulToRequest:(NSDictionary *)response
{
    long long int responseCode=[[response objectForKey:@"code"] longLongValue];
    switch (responseCode) {
        case 200:
        {
            NSMutableDictionary *infoDict=[response objectForKey:@"message"];
            [[AccountInfoHandler sharedAccountHandler] updateInfo:infoDict];
            dispatch_async(dispatch_get_main_queue(), ^{
                AddSpecialViewController *asvc;
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    asvc = [[AddSpecialViewController alloc] initWithNibName:@"AddSpecialViewController_iPhone" bundle:nil];
                } else
                {
                    asvc = [[AddSpecialViewController alloc] initWithNibName:@"AddSpecialViewController_iPad" bundle:nil];
                }
                [self.navigationController pushViewController:asvc animated:YES];
                [asvc release];
            });
            break;
        }
        case 500:
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *wrongPassAlert= [[UIAlertView alloc] initWithTitle:@"Failure" message:@"password/username wrong" delegate:nil cancelButtonTitle:@"Retry" otherButtonTitles:nil];
                [wrongPassAlert show];
                [wrongPassAlert release];
            });
            NSLog(@"Wrong password/username");
            break;
        }

        default:
            break;
    }
            
}
- (void)failToRequestWithError:(NSString *)errorStr
{
    NSLog(@"error:%@",errorStr);
}

#pragma UITextFieldDelegate methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [scrollView setContentOffset:CGPointMake(0, 90) animated:YES];
    [scrollView setScrollEnabled:YES];
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    [self recoverUI];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [scrollView setScrollEnabled:NO];
    return YES;
}

#pragma UI

- (void)recoverUI
{
    [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}


@end
