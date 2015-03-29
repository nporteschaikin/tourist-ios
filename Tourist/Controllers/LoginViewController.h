//
//  LoginViewController.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Session.h"

@class LoginViewController;

@protocol LoginViewControllerDelegate

- (void)loginViewController:(LoginViewController *)loginViewController
             createdSession:(Session *)session;

@end

@interface LoginViewController : UIViewController

@property (strong, nonatomic) id<LoginViewControllerDelegate> delegate;

- (void)showLoginFacebookButton;
- (void)hideLoginFacebookButton;

@end
