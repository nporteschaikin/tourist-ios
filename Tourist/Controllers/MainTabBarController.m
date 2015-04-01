//
//  MainTabBarController.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "MainTabBarController.h"
#import "ToursNearbyViewController.h"

@interface MainTabBarController ()

@property (strong, nonatomic) Session *session;
@property (strong, nonatomic) UINavigationController *toursNearbyNavigationController;
@property (strong, nonatomic) UINavigationController *toursFavoritesNavigationController;

@end

@implementation MainTabBarController

- (id)initWithSession:(Session *)session {
    if (self = [super init]) {
        self.session = session;
        
        /*
         * Set up controllers
         */
        
        self.viewControllers = @[self.toursNearbyNavigationController,
                                 self.toursFavoritesNavigationController];
    }
    return self;
}

- (UINavigationController *)toursNearbyNavigationController {
    if (!_toursNearbyNavigationController) {
        
        /*
         * Create ToursNearbyViewController
         */
        
        ToursNearbyViewController *toursNearbyViewController = [[ToursNearbyViewController alloc] initWithSession:self.session];
        
        /*
         * Set tab bar item.
         */
        
        toursNearbyViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured
                                                                                          tag:0];
        toursNearbyViewController.tabBarItem.title = @"Nearby";
        
        /*
         * Set navigation bar button item
         */
        
        toursNearbyViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                                                                                    target:self
                                                                                                                    action:@selector(handleToursNearbyViewControllerComposeButton)];
        /*
         * Create navigation controller
         */
        
        _toursNearbyNavigationController = [[UINavigationController alloc] initWithRootViewController:toursNearbyViewController];
    }
    return _toursNearbyNavigationController;
}

- (void)handleToursNearbyViewControllerComposeButton {
    
    /*
     * Present CreateTourViewController
     */
    
    [self.theDelegate presentTourEditorViewController];
}

- (UINavigationController *)toursFavoritesNavigationController {
    if (!_toursFavoritesNavigationController) {
        _toursFavoritesNavigationController = [[UINavigationController alloc] init];
    }
    return _toursFavoritesNavigationController;
}

@end
