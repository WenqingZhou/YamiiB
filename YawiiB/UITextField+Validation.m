//
//  UITextField+Validation.m
//  YawiiB
//
//  Created by wenqing zhou on 10/29/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import "UITextField+Validation.h"

@implementation UITextField (Validation)

-(BOOL)isValidStringAndFocus:(BOOL)shouldFocus
{
    if (self.text==nil || [self.text isEqualToString:@""]) {
        if (shouldFocus) {
            [self becomeFirstResponder];
        }
        return NO;
    }
    else
    {
        return YES;
    }
}

@end


@implementation UILabel (Validation)

-(BOOL)isValidStringAndFocus:(BOOL)shouldFocus
{
    if (self.text==nil || [self.text isEqualToString:@""]) {
        if (shouldFocus) {
            [self becomeFirstResponder];
        }
        return NO;
    }
    else
    {
        return YES;
    }
}

@end