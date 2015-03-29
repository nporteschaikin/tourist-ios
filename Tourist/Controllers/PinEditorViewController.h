//
//  PinEditorViewController.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PinEditorViewController;

@protocol PinEditorViewControllerDelegate

- (void)dismissPinEditorViewController:(PinEditorViewController *)controller;
- (void)pinEditorViewController:(PinEditorViewController *)controller
                        sentPin:(NSDictionary *)pin;

@end

@interface PinEditorViewController : UIViewController

@property (strong, nonatomic) id<PinEditorViewControllerDelegate> delegate;
@property (strong, nonatomic, readonly) NSDictionary *pin;

@end
