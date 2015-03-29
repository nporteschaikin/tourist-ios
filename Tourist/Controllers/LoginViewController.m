//
//  LoginViewController.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "LoginViewController.h"

@interface LoginViewController () <SessionDelegate, FBLoginViewDelegate>

@property (strong, nonatomic) FBLoginView *loginView;
@property (strong, nonatomic) UIButton *loginFacebookButton;
@property (strong, nonatomic) NSLayoutConstraint *loginFacebookButtonBottomConstraint;
@property (strong, nonatomic) Session *session;

@end

@implementation LoginViewController

- (id)init {
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor blackColor];
        [self.view addSubview:self.loginFacebookButton];
        [self setupConstraints];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * Try logging in with session
     */
    
    self.session = [[Session alloc] initWithSessionToken];
    self.session.delegate = self;
    [self.session requestSession];
    
}

/*
 * Set up layout constraints
 */

- (void)setupConstraints {
    [self.view addConstraint:self.loginFacebookButtonBottomConstraint];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.loginFacebookButton
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.loginFacebookButton
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:0]];
}

/*
 * Sign in with Facebook button
 */

- (UIButton *)loginFacebookButton {
    if (!_loginFacebookButton) {
        _loginFacebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginFacebookButton.backgroundColor = [UIColor colorWithRed:0.231
                                                               green:0.349
                                                                blue:0.596
                                                               alpha:1];
        _loginFacebookButton.translatesAutoresizingMaskIntoConstraints = NO;
        _loginFacebookButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        [_loginFacebookButton setTitle:@"Sign in with Facebook"
                              forState:UIControlStateNormal];
        [_loginFacebookButton addTarget:self action:@selector(signInWithFacebook)
                       forControlEvents:UIControlEventTouchDown];
        [_loginFacebookButton sizeToFit];
    }
    return _loginFacebookButton;
}

/*
 * Sign in with Facebook
 */

- (void)signInWithFacebook {
    [FBSession openActiveSessionWithReadPermissions:@[]
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
                                      if (FBSession.activeSession.state == FBSessionStateOpen) {
                                          [self signedInWithFacebook];
                                      }
                                  }];
}

/*
 * Signed in with Facebook
 */

- (void)signedInWithFacebook {
    
    /*
     * Get access token.
     */
    
    FBAccessTokenData *accessTokenData = [[FBSession activeSession] accessTokenData];
    NSString *facebookAccessToken = [accessTokenData accessToken];
    
    /*
     * Use token to create session
     */
    
    self.session = [[Session alloc] initWithFacebookAccessToken:facebookAccessToken];
    self.session.delegate = self;
    [self.session requestSession];
    
}

/*
 * Show facebook button
 */

- (void)showLoginFacebookButton {
    self.loginFacebookButtonBottomConstraint.constant = 0;
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

/*
 * Hide facebook button
 */

- (void)hideLoginFacebookButton {
    self.loginFacebookButtonBottomConstraint.constant = self.loginFacebookButton.frame.size.height;
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

/*
 * Facebook button bottom constraint
 */

- (NSLayoutConstraint *)loginFacebookButtonBottomConstraint {
    if (!_loginFacebookButtonBottomConstraint) {
        _loginFacebookButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.loginFacebookButton
                                                                            attribute:NSLayoutAttributeBottom
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.view
                                                                            attribute:NSLayoutAttributeBottom
                                                                           multiplier:1
                                                                             constant:self.loginFacebookButton.frame.size.height];
    }
    return _loginFacebookButtonBottomConstraint;
}

/*
 * SessionDelegate
 */

- (void)sessionCreated:(Session *)session {
    
    /*
     * Send delegate message.
     */
    
    [self.delegate loginViewController:self
                        createdSession:session];
    
}

- (void)sessionFailed:(Session *)session {
    
    /*
     * Show facebook button
     */
    
    [FBSession.activeSession closeAndClearTokenInformation];
    [FBSession.activeSession close];
    [FBSession setActiveSession:nil];
    [self showLoginFacebookButton];
    
}

- (void)session:(Session *)session error:(NSError *)error {
    
    /*
     * Not online?
     */
    
}

@end


