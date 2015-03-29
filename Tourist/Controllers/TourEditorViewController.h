//
//  TourEditorViewController.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Session.h"

@class TourEditorViewController;

@protocol TourEditorViewControllerDelegate

- (void)dismissTourEditorViewController;

@end

@interface TourEditorViewController : UIViewController

@property (strong, nonatomic) id<TourEditorViewControllerDelegate> delegate;

- (id)initWithSession:(Session *)session;

@end
