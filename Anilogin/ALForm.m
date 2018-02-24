//
//  ALForm.m
//  Anilogin
//
//  Created by George Prokopenko on 25.02.2018.
//  Copyright © 2018 George Prokopenko. All rights reserved.
//

#import "ALForm.h"

typedef enum EyesState : NSInteger {
    EyesStateOpened,
    EyesStateClosed
} EyesState;

typedef enum EyesPositioningMode : NSInteger {
    EyesPositioningModeStraight,
    EyesPositioningModeDown,
    EyesPositioningModeTrack
} EyesPositioningMode;

@implementation ALForm {
    EyesPositioningMode eyesPositioningMode;
    EyesState eyesState;
}

- (void) drawRect:(CGRect)rect {
    
    [self setElementsAppearence];
    
    [self.loginField addTarget:self action:@selector(textFieldChangedText:) forControlEvents:UIControlEventEditingChanged];
    
    eyesState = EyesStateOpened;
    eyesPositioningMode = EyesPositioningModeStraight;
    [self animateEyesWithHorizontalPosition:0];
}

- (void) setElementsAppearence {
    // RADIUS
    self.formView.layer.cornerRadius = 28.0;
    self.loginField.layer.cornerRadius = 20.0;
    self.passwordField.layer.cornerRadius = 20.0;
    self.submitButton.layer.cornerRadius = 20.0;
    
    // BORDER
    self.loginField.layer.borderWidth = 1.0;
    self.passwordField.layer.borderWidth = 1.0;
    self.loginField.layer.borderColor = self.passwordField.backgroundColor.CGColor;
    self.passwordField.layer.borderColor = self.passwordField.backgroundColor.CGColor;
    
    // BACKGROUND
    self.loginField.backgroundColor = [UIColor clearColor];
    self.passwordField.backgroundColor = [UIColor clearColor];
    
}

- (void) animateEyesWithHorizontalPosition:(int)horizontalPos {
    
    int horizontalPosition;
    int verticalPosition;
    
    switch (eyesPositioningMode) {
        case EyesPositioningModeStraight:
            horizontalPosition = 0;
            verticalPosition = 0;
            break;
        case EyesPositioningModeDown:
            horizontalPosition = 0;
            verticalPosition = 6;
            break;
        case EyesPositioningModeTrack:
            horizontalPosition = horizontalPos;
            verticalPosition = 5;
            break;
        default:
            break;
    }
    
    [UIView animateWithDuration:1.2 animations:^{
        self.owlLeftEye.transform = CGAffineTransformTranslate(self.owlLeftEye.transform, horizontalPosition-self.owlLeftEye.transform.tx, verticalPosition-self.owlLeftEye.transform.ty);
        self.owlRightEye.transform = CGAffineTransformTranslate(self.owlRightEye.transform, horizontalPosition-self.owlRightEye.transform.tx, verticalPosition-self.owlRightEye.transform.ty);
    }];
    
}

- (void) openEyes {
    if (eyesState == EyesStateOpened) return;
    [UIView animateWithDuration:0.8 animations:^{
        
        //self.owlLeftWing.transform = CGAffineTransformRotate(self.owlLeftWing.transform, -0.1);
        //self.owlRightWing.transform = CGAffineTransformRotate(self.owlRightWing.transform, 0.1);
        self.owlLeftWing.transform = CGAffineTransformTranslate(self.owlLeftWing.transform, 0, 55);
        self.owlRightWing.transform = CGAffineTransformTranslate(self.owlRightWing.transform, 0, 55);
    }];
    eyesState = EyesStateOpened;
}

- (void) closeEyes {
    if (eyesState == EyesStateClosed) return;
    [UIView animateWithDuration:0.8 animations:^{
        //self.owlLeftWing.transform = CGAffineTransformRotate(self.owlLeftWing.transform, 0.1);
        //self.owlRightWing.transform = CGAffineTransformRotate(self.owlRightWing.transform, -0.1);
        self.owlLeftWing.transform = CGAffineTransformTranslate(self.owlLeftWing.transform, 0, -55);
        self.owlRightWing.transform = CGAffineTransformTranslate(self.owlRightWing.transform, 0, -55);
    }];
    eyesState = EyesStateClosed;
}

#pragma mark Text Field

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.loginField) {
        [self openEyes];
        eyesPositioningMode = EyesPositioningModeDown;
        [self animateEyesWithHorizontalPosition:0];
    } else {
        [self closeEyes];
    }
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
//    if (textField == self.loginField) {
//        eyesPositioningMode = EyesPositioningModeStraight;
//        [self animateEyesWithHorizontalPosition:0];
//    } else {
//        [self openEyes];
//    }
}

- (void) textFieldChangedText:(UITextField*)textField {
    if (textField.text.length == 0) {
        eyesPositioningMode = EyesPositioningModeStraight;
        [self animateEyesWithHorizontalPosition:0];
        return;
    }
    if (eyesState == EyesStateClosed){ [self openEyes];}
    eyesPositioningMode = EyesPositioningModeTrack;
    int desiredPosition = (int)(textField.text.length/3.5) - 5;
    [self animateEyesWithHorizontalPosition:desiredPosition];
}

@end
