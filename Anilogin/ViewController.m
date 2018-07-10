//
//  ViewController.m
//  Anilogin
//
//  Created by George Prokopenko on 25.02.2018.
//  Copyright © 2018 George Prokopenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <ALFormDelegate>
@property (weak, nonatomic) IBOutlet ALForm* alForm;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* You can change colors of ALForm here.
     Use properties below:
    
     self.alForm.formView;
     self.alForm.loginField;
     self.alForm.passwordField;
     self.alForm.submitButton;
     */
    
    self.alForm.delegate = self;
}

#pragma mark ALForm Delegate

- (void) alFormDidBeginEditing {
    [UIView animateWithDuration:0.35 animations:^{
        self.alForm.transform = CGAffineTransformMakeTranslation(self.alForm.transform.tx, -100);
    }];
    
    NSLog(@"ALFormDidBeginEditing");
}

- (void) alFormSubmitButtonTapped {
    [UIView animateWithDuration:0.4 animations:^{
        self.alForm.transform = CGAffineTransformMakeTranslation(self.alForm.transform.tx, 0);
    }];
    
    NSLog(@"ALFormSubmitButtonTapped");
    NSLog(@"ALForm login: %@, password: %@", self.alForm.loginField.text, self.alForm.passwordField.text);
}

- (void) alFormDidEndEditing {
    NSLog(@"ALFormDidEndEditing");
}

@end
