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
        
        [self addSubview:self.nameTextField];
        [self addSubview:self.descriptionTextField];
        
        /*
         * Setup constraints.
         */
        
        [self setupConstraints];
        
    }
    return self;
}

- (void)setupConstraints {
    
    /*
     * descriptionTextField
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextField
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:-17]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextField
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:17]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextField
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:-17]];
    
    /*
     * nameTextField
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.descriptionTextField
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:-8]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.descriptionTextField
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.descriptionTextField
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    
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

@end
