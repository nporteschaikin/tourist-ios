//
//  TourHeaderView.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "TourHeaderView.h"

@interface TourHeaderView ()

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;
@property (strong, nonatomic) UILabel *userNameLabel;
@property (strong, nonatomic) UILabel *pinsLabel;

@end

@implementation TourHeaderView

- (id)init {
    if (self = [super init]) {
        
        /*
         * Add background color.
         */
        
        self.backgroundColor = [UIColor blackColor];
        
        /*
         * Add subviews.
         */
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.descriptionLabel];
        [self addSubview:self.pinsLabel];
        
        /*
         * Update constraints.
         */
        
        [self setupConstraints];
        
    }
    return self;
}

- (void)setupConstraints {
    
    /*
     * nameLabel
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:17]];
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
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:-17]];
    
    /*
     * descriptionLabel
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:8]];
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
    
    /*
     * pinLabel
     */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pinsLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:-17]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pinsLabel
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
        _nameLabel.textColor = [UIColor whiteColor];
    }
    return _nameLabel;
}

- (UILabel *)descriptionLabel {
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _descriptionLabel.textColor = [UIColor whiteColor];
    }
    return _descriptionLabel;
}

- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _userNameLabel.textColor = [UIColor whiteColor];
    }
    return _userNameLabel;
}

- (UILabel *)pinsLabel {
    if (!_pinsLabel) {
        _pinsLabel = [[UILabel alloc] init];
        _pinsLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _pinsLabel.textColor = [UIColor whiteColor];
    }
    return _pinsLabel;
}

- (void)setPinsCount:(NSNumber *)pinsCount {
    _pinsCount = pinsCount;
    
    /*
     * Set pins label.
     */
    
    self.pinsLabel.text = [NSString stringWithFormat:@"%@ pins", _pinsCount];
}

@end
