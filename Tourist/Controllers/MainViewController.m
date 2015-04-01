//
//  MainViewController.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "MainViewController.h"
#import "MainTabBarController.h"
#import "LoginViewController.h"
#import "TourEditorViewController.h"
#import "Session.h"

@interface MainViewController () <LoginViewControllerDelegate, MainTabBarControllerDelegate, TourEditorViewControllerDelegate>

@property (strong, nonatomic) MainTabBarController *tabBarController;
@property (strong, nonatomic) LoginViewController *loginViewController;
@property (strong, nonatomic) TourEditorViewController *tourEditorViewController;
@property (strong, nonatomic) Session *session;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * Start!
     */
    
    [self start];
}

- (void)start {
    
    /*
     * Show login view
     */
    
    [self presentLoginViewController];
    
}

- (void)presentLoginViewController {
    [self addChildViewController:self.loginViewController];
    [self.view addSubview:self.loginViewController.view];
    [self.loginViewController didMoveToParentViewController:self];
}

- (void)dismissLoginViewController {
    [UIView animateWithDuration:1
                     animations:^{
                         self.loginViewController.view.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         [self.loginViewController.view removeFromSuperview];
                         [self.loginViewController removeFromParentViewController];
                         [self.loginViewController didMoveToParentViewController:nil];
                         self.loginViewController = nil;
                     }];
}

- (void)presentTabBarController {
    
    /*
     * Add tab bar controller as child.
     */
    
    if (self.tabBarController) {
        [self addChildViewController:self.tabBarController];
        [self.view addSubview:self.tabBarController.view];
        [UIView animateWithDuration:0.25f
                         animations:^{
                             self.tabBarController.view.alpha = 1.0f;
                         } completion:^(BOOL finished) {
                             [self.tabBarController didMoveToParentViewController:self];
                         }];
    }
}

- (void)presentTourEditorViewController {
    
    /*
     * Create tour editor view controller.
     */
    
    self.tourEditorViewController = [[TourEditorViewController alloc] initWithSession:self.session];
    self.tourEditorViewController.delegate = self;
    self.tourEditorViewController.view.alpha = 0.0f;
    
    /*
     * Present tour editor view controller.
     */
    
    [self addChildViewController:self.tourEditorViewController];
    [self.view addSubview:self.tourEditorViewController.view];
    [UIView animateWithDuration:0.25f
                     animations:^{
                         self.tourEditorViewController.view.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                         
                         /*
                          * Move to parent.
                          */
                         
                         [self.tourEditorViewController didMoveToParentViewController:self];
                         
                     }];
}



- (void)dismissTourEditorViewController {
    [UIView animateWithDuration:0.25f
                     animations:^{
                         self.tourEditorViewController.view.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         
                         /*
                          * Remove from parent.
                          */
                         
                         [self.tourEditorViewController removeFromParentViewController];
                         [self.tourEditorViewController.view removeFromSuperview];
                         [self.tourEditorViewController didMoveToParentViewController:nil];
                         
                         /*
                          * Remove from memory.
                          */
                         
                         self.tourEditorViewController = nil;
                         
                     }];
}

/*
 * Login view controller
 */

- (LoginViewController *)loginViewController {
    if (!_loginViewController) {
        _loginViewController = [[LoginViewController alloc] init];
        _loginViewController.delegate = self;
    }
    return _loginViewController;
}

/*
 * Login view controller delegate
 */

- (void)loginViewController:(LoginViewController *)loginViewController
             createdSession:(Session *)session {
    
    /*
     * Set session
     */
    
    self.session = session;
    
    /*
     * Hide login view controller
     */
    
    [self dismissLoginViewController];
    
    /*
     * Create tab bar controller.
     */
    
    self.tabBarController = [[MainTabBarController alloc] initWithSession:session];
    self.tabBarController.theDelegate = self;
    
    /*
     * Show tab bar controller.
     */
    
    [self presentTabBarController];
    
}

@end
