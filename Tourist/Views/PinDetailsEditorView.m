//
//  PinDetailsEditorView.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "PinDetailsEditorView.h"
#import "UIButton+Tourist.h"
#import "UIColor+Tourist.h"

@interface PinDetailsEditorView ()

@property (strong, nonatomic) FoursquareVenueView *venueView;
@property (strong, nonatomic) UITextView *descriptionTextView;
@property (strong, nonatomic) UIButton *saveButton;

@end

@implementation PinDetailsEditorView

- (id)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.venueView];
        [self addSubview:self.descriptionTextView];
        [self addSubview:self.saveButton];
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints {
    
    /*
     * venueView
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.venueView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.venueView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.venueView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    
    /*
     * descriptionTextView
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.venueView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.saveButton
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    
    /*
     * saveButton
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.saveButton
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.saveButton
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.saveButton
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:0]];
}

- (FoursquareVenueView *)venueView {
    if (!_venueView) {
        _venueView = [[FoursquareVenueView alloc] init];
        _venueView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _venueView;
}

- (UITextView *)descriptionTextView {
    if (!_descriptionTextView) {
        _descriptionTextView = [[UITextView alloc] init];
        _descriptionTextView.translatesAutoresizingMaskIntoConstraints = NO;
        _descriptionTextView.textContainerInset = UIEdgeInsetsMake(13, 13, 13, 13);
        _descriptionTextView.font = [UIFont fontWithName:@"Arial"
                                                    size:18.f];
    }
    return _descriptionTextView;
}

- (UIButton *)saveButton {
    if (!_saveButton) {
        _saveButton = [UIButton touristLargeButton];
        _saveButton.translatesAutoresizingMaskIntoConstraints = NO;
        _saveButton.backgroundColor = [UIColor touristBlueColorAlpha:1];
        [_saveButton setTitle:@"Save"
                     forState:UIControlStateNormal];
        [_saveButton setTitleColor:[UIColor whiteColor]
                          forState:UIControlStateNormal];
        [_saveButton addTarget:self
                        action:@selector(handleSaveButtonTouchDown)
              forControlEvents:UIControlEventTouchDown];
    }
    return _saveButton;
}

- (void)handleSaveButtonTouchDown {
    [self.delegate pinDetailsEditorView:self
                                 action:PinDetailsEditorViewActionSave];
}

@end
