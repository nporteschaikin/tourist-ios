//
//  TourEditorHeaderView.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "TourEditorHeaderView.h"
#import "TouristTextField.h"
#import "UIColor+Tourist.h"
#import "Constants.h"

@interface TourEditorHeaderView ()

@property (strong, nonatomic) UITextField *nameTextField;
@property (strong, nonatomic) UITextField *descriptionTextField;
@property (strong, nonatomic) UIButton *pictureButton;
@property (strong, nonatomic) UIImageView *photoView;

@end

@implementation TourEditorHeaderView

- (id)init {
    if (self = [super init]) {
        
        /*
         * Style local view.
         */
        
        self.backgroundColor = [UIColor blackColor];
        
        /*
         * Add subviews
         */
        
        [self addSubview:self.photoView];
        [self insertSubview:self.nameTextField
               aboveSubview:self.photoView];
        [self insertSubview:self.descriptionTextField
               aboveSubview:self.photoView];
        [self insertSubview:self.pictureButton
               aboveSubview:self.photoView];
        
        /*
         * Setup constraints.
         */
        
        [self setupConstraints];
        
    }
    return self;
}

- (void)setupConstraints {
    
    [self addConstraints:@[
                           
                           /*
                            * photoView
                            */
                           
                           [NSLayoutConstraint constraintWithItem:self.photoView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1
                                                         constant:0],
                           [NSLayoutConstraint constraintWithItem:self.photoView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1
                                                         constant:0],
                           [NSLayoutConstraint constraintWithItem:self.photoView
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1
                                                         constant:0],
                           [NSLayoutConstraint constraintWithItem:self.photoView
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1
                                                         constant:0],
                           
                           /*
                            * descriptionTextField
                            */
                           
                           [NSLayoutConstraint constraintWithItem:self.descriptionTextField
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1
                                                         constant:-17],
                           [NSLayoutConstraint constraintWithItem:self.descriptionTextField
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1
                                                         constant:17],
                           [NSLayoutConstraint constraintWithItem:self.descriptionTextField
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1
                                                         constant:-17],
                           
                           /*
                            * nameTextField
                            */
                           
                           [NSLayoutConstraint constraintWithItem:self.nameTextField
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.descriptionTextField
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1
                                                         constant:-8],
                           [NSLayoutConstraint constraintWithItem:self.nameTextField
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.descriptionTextField
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1
                                                         constant:0],
                           [NSLayoutConstraint constraintWithItem:self.nameTextField
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.descriptionTextField
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1
                                                         constant:0],
                           
                           /*
                            * pictureButton
                            */
                           
                           [NSLayoutConstraint constraintWithItem:self.pictureButton
                                                        attribute:NSLayoutAttributeCenterX
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeCenterX
                                                       multiplier:1
                                                         constant:0],
                           [NSLayoutConstraint constraintWithItem:self.pictureButton
                                                        attribute:NSLayoutAttributeCenterY
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeCenterY
                                                       multiplier:1
                                                         constant:0]
                           ]];
    
}

- (UITextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [[UITextField alloc] init];
        _nameTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _nameTextField.textColor = [UIColor whiteColor];
        _nameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter a name..."
                                                                               attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    }
    return _nameTextField;
}

- (UITextField *)descriptionTextField {
    if (!_descriptionTextField) {
        _descriptionTextField = [[UITextField alloc] init];
        _descriptionTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _descriptionTextField.textColor = [UIColor whiteColor];
        _descriptionTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter a description..."
                                                                                      attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    }
    return _descriptionTextField;
}

- (UIButton *)pictureButton {
    if (!_pictureButton) {
        _pictureButton = [[UIButton alloc] init];
        _pictureButton.translatesAutoresizingMaskIntoConstraints = NO;
        _pictureButton.contentEdgeInsets = UIEdgeInsetsMake(8, 10, 8, 10);
        [_pictureButton setTitleColor:[UIColor whiteColor]
                             forState:UIControlStateNormal];
        [_pictureButton setTitle:@"Tap to add a cover photo"
                        forState:UIControlStateNormal];
        [_pictureButton addTarget:self
                           action:@selector(handlePictureButton)
                 forControlEvents:UIControlEventTouchDown];
    }
    return _pictureButton;
}

- (UIImageView *)photoView {
    if (!_photoView) {
        _photoView = [[UIImageView alloc] init];
        _photoView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _photoView;
}

- (void)setPhoto:(UIImage *)photo {
    _photo = photo;
    
    /*
     * Set photo view image.
     */
    
    self.photoView.image = photo;
}

- (void)handlePictureButton {
    [self.delegate tourEditorHeaderViewTappedPictureButton:self];
}

@end
