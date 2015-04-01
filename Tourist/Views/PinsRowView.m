//
//  PinsRowView.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/31/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "PinsRowView.h"
#import "Constants.h"

@interface PinsRowView ()

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *categoryLabel;
@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;
@property (strong, nonatomic) UILabel *numberLabel;

@end

@implementation PinsRowView

- (id)init {
    if (self = [super init]) {
        
        /*
         * Style view.
         */
        
        self.backgroundColor = [UIColor whiteColor];
        
        /*
         * Add subviews.
         */
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.categoryLabel];
        [self addSubview:self.addressLabel];
        [self addSubview:self.descriptionLabel];
        [self addSubview:self.numberLabel];
        
        /*
         * Setup constraints.
         */
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints {
    
    /*
     * numberLabel
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.numberLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:17]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.numberLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:-17]];
    
    /*
     * nameLabel
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:17]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.numberLabel
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:-30]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:17]];
    
    /*
     * categoryLabel
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.categoryLabel
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.categoryLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.categoryLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:8]];
    
    /*
     * addressLabel
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.addressLabel
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.addressLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.addressLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.categoryLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:8]];
    
    /*
     * addressLabel
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.addressLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:16]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:-17]];
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _nameLabel.numberOfLines = 0;
        _nameLabel.font = [UIFont fontWithName:TouristDefaultBoldFontName
                                          size:18.0f];
    }
    return _nameLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _addressLabel.numberOfLines = 0;
        _addressLabel.font = [UIFont fontWithName:TouristDefaultFontName
                                             size:16.0f];
    }
    return _addressLabel;
}

- (UILabel *)categoryLabel {
    if (!_categoryLabel) {
        _categoryLabel = [[UILabel alloc] init];
        _categoryLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _categoryLabel.numberOfLines = 1;
        _categoryLabel.font = [UIFont fontWithName:TouristDefaultFontName
                                              size:16.0f];
    }
    return _categoryLabel;
}

- (UILabel *)descriptionLabel {
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _descriptionLabel.numberOfLines = 0;
        _descriptionLabel.textColor = [UIColor grayColor];
        _descriptionLabel.font = [UIFont fontWithName:TouristDefaultFontName
                                                 size:18.0f];
    }
    return _descriptionLabel;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _numberLabel.numberOfLines = 0;
        _numberLabel.textColor = [UIColor colorWithWhite:0.8
                                                   alpha:0.5];
        _numberLabel.font = [UIFont fontWithName:TouristDefaultFontName
                                            size:40.0f];
    }
    return _numberLabel;
}

@end
