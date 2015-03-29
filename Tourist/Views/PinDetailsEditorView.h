//
//  PinDetailsEditorView.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoursquareVenueView.h"

@class PinDetailsEditorView;

typedef NS_ENUM(NSUInteger, PinDetailsEditorViewAction) {
    PinDetailsEditorViewActionSave
};

@protocol PinDetailsEditorViewDelegate

- (void)pinDetailsEditorView:(PinDetailsEditorView *)view
                      action:(PinDetailsEditorViewAction)action;

@end

@interface PinDetailsEditorView : UIView

@property (strong, nonatomic) id<PinDetailsEditorViewDelegate> delegate;
@property (strong, nonatomic, readonly) FoursquareVenueView *venueView;
@property (strong, nonatomic, readonly) UITextView *descriptionTextView;

@end
