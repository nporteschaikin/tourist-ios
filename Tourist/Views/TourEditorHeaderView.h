//
//  TourEditorHeaderView.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TourEditorHeaderView;

@protocol TourEditorHeaderViewDelegate

- (void)tourEditorHeaderViewTappedPictureButton:(TourEditorHeaderView *)view;

@end

@interface TourEditorHeaderView : UIView

@property (strong, nonatomic) id<TourEditorHeaderViewDelegate> delegate; 
@property (strong, nonatomic, readonly) UITextField *nameTextField;
@property (strong, nonatomic, readonly) UITextField *descriptionTextField;
@property (strong, nonatomic) UIImage *photo;

@end
