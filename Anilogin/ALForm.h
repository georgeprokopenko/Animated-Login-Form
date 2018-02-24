//
//  ALForm.h
//  Anilogin
//
//  Created by George Prokopenko on 25.02.2018.
//  Copyright © 2018 George Prokopenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALForm : UIView <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView* formView;
@property (weak, nonatomic) IBOutlet UITextField* loginField;
@property (weak, nonatomic) IBOutlet UITextField* passwordField;
@property (weak, nonatomic) IBOutlet UIButton* submitButton;

@property (weak, nonatomic) IBOutlet UIImageView* owl;
@property (weak, nonatomic) IBOutlet UIImageView* owlLeftEye;
@property (weak, nonatomic) IBOutlet UIImageView* owlRightEye;

@property (weak, nonatomic) IBOutlet UIImageView* owlLeftWing;
@property (weak, nonatomic) IBOutlet UIImageView* owlRightWing;

@end
