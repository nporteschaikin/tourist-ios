//
//  MainTabBarController.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Session.h"

@protocol MainTabBarControllerDelegate

- (void)presentTourEditorViewController;

@end

@interface MainTabBarController : UITabBarController

@property (weak, nonatomic) id<MainTabBarControllerDelegate> theDelegate;

- (id)initWithSession:(Session *)session;

@end
