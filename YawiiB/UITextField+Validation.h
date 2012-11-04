//
//  UITextField+Validation.h
//  YawiiB
//
//  Created by wenqing zhou on 10/29/12.
//  Copyright (c) 2012 Yawii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Validation)

-(BOOL)isValidStringAndFocus:(BOOL)shouldFocus;

@end

@interface UILabel (Validation)

-(BOOL)isValidStringAndFocus:(BOOL)shouldFocus;

@end
