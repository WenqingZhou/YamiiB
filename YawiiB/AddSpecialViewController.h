//
//  ViewController.h
//  demo
//
//  Created by wenqing zhou on 10/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SSTextView.h"
#import "AZUITextField.h"

@interface AddSpecialViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate,UIScrollViewAccessibilityDelegate>
{
    IBOutlet AZUITextField *originalPriceTextField;
    IBOutlet AZUITextField *newPriceTextField;
    IBOutlet UILabel *percentLabel;
    IBOutlet UILabel *timeLabel;
    IBOutlet UILabel *amountLabel;
    IBOutlet UISlider *timeSlider;
    IBOutlet UISlider *amountSlider;
    IBOutlet SSTextView *commentView;
    IBOutlet UIButton *previewBtn;
    IBOutlet UIView *contentView;
    IBOutlet UIScrollView *scrollView;
}

@property NSTimeInterval timestamp;

- (double)getPercentValue:(double)orignal newValue:(double)newValue;
- (void)updatePercentForOriginalPrice:(double)originalPrice newValue:(double)newPrice;
- (void)timeChanged;
- (void)amountChanged;



@end
