//
//  ALForm.h
//  Anilogin
//
//  Created by George Prokopenko on 25.02.2018.
//  Copyright © 2018 George Prokopenko. All rights reserved.
//

#pragma once

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ALFormTypeOwl,
} ALFormType;

IB_DESIGNABLE

@protocol ALFormDelegate <NSObject>
@optional
- (void) alFormDidBeginEditing;
- (void) alFormDidEndEditing;
- (void) alFormSubmitButtonTapped;
@end

@interface ALForm : UIView <UITextFieldDelegate>

@property (assign, nonatomic) id <ALFormDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView* formView;
@property (weak, nonatomic) IBOutlet UITextField* loginField;
@property (weak, nonatomic) IBOutlet UITextField* passwordField;
@property (weak, nonatomic) IBOutlet UIButton* submitButton;

@end
