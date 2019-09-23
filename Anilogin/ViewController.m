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
    
}

#pragma mark ALForm Delegate

- (void) alFormDidBeginEditing {
    [UIView animateWithDuration:0.35 animations:^{
        self.alForm.transform = CGAffineTransformMakeTranslation(self.alForm.transform.tx, -100);
    }];
    
    NSLog(@"ALFormDidBeginEditing");
}

- (void) alFormSubmitButtonTapped {
    if (self.alForm.loginField.text.length == 0) [self.alForm showError:YES text:@"Invalid login/password"];
    [UIView animateWithDuration:0.4 animations:^{
        self.alForm.transform = CGAffineTransformMakeTranslation(self.alForm.transform.tx, 0);
    }];
    
    NSLog(@"ALFormSubmitButtonTapped");
}

- (void) alFormDidEndEditing {
    NSLog(@"ALFormDidEndEditing");
}

@end
