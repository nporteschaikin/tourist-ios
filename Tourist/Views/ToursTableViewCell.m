//
//  ToursTableViewCell.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "ToursTableViewCell.h"
#import "Constants.h"

@interface ToursTableViewCell ()

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;
@property (strong, nonatomic) UILabel *userNameLabel;

@end

@implementation ToursTableViewCell

- (id)init {
    if (self = [super init]) {
        [self setupView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
    /*
     * Add background color.
     */
    
    self.backgroundColor = [UIColor blackColor];
    
    /*
     * Add subviews.
     */
    
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.descriptionLabel];
    
    /*
     * Update constraints.
     */
    
    [self setupConstraints];
    
}

- (void)setupConstraints {
    
    [self.contentView addConstraints:@[
                                       
                                       /*
                                        * nameLabel
                                        */
                                       
                                       [NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:17],
                                       [NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:17],
                                       [NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:-17],
                                       
                                       /*
                                        * descriptionLabel
                                        */
                                       
                                       [NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:8],
                                       [NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:0],
                                       [NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:0]
                                       ]];
    
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont fontWithName:TouristDefaultBoldFontName
                                          size:16.0f];
    }
    return _nameLabel;
}

- (UILabel *)descriptionLabel {
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _descriptionLabel.textColor = [UIColor whiteColor];
        _descriptionLabel.font = [UIFont fontWithName:TouristDefaultFontName
                                                 size:14.0f];
    }
    return _descriptionLabel;
}

@end
