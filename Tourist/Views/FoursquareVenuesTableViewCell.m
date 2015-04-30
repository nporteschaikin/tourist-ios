//
//  FoursquareVenuesTableViewCell.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "FoursquareVenuesTableViewCell.h"

@interface FoursquareVenuesTableViewCell ()

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *categoryLabel;
@property (strong, nonatomic) UILabel *addressLabel;

@end

@implementation FoursquareVenuesTableViewCell

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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.categoryLabel];
    [self.contentView addSubview:self.addressLabel];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.contentView addConstraints:@[
                                       
                                       /*
                                        * nameLabel
                                        */
                                       
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
                                       [NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:17],
                                       
                                       /*
                                        * categoryLabel
                                        */
                                       
                                       [NSLayoutConstraint constraintWithItem:self.categoryLabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:0],
                                       [NSLayoutConstraint constraintWithItem:self.categoryLabel
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:0],
                                       [NSLayoutConstraint constraintWithItem:self.categoryLabel
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:8],
                                       
                                       /*
                                        * addressLabel
                                        */
                                       
                                       [NSLayoutConstraint constraintWithItem:self.addressLabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:0],
                                       [NSLayoutConstraint constraintWithItem:self.addressLabel
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:0],
                                       [NSLayoutConstraint constraintWithItem:self.addressLabel
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.categoryLabel
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:8]
                                       
                                       ]];
    
    /*
     * Add height constraint
     */
    
    NSLayoutConstraint *hConstraint = [NSLayoutConstraint constraintWithItem:self.addressLabel
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.contentView
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1
                                                                    constant:-17];
    hConstraint.priority = 999;
    [self.contentView addConstraint:hConstraint];
    

}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _addressLabel.numberOfLines = 0;
    }
    return _addressLabel;
}

- (UILabel *)categoryLabel {
    if (!_categoryLabel) {
        _categoryLabel = [[UILabel alloc] init];
        _categoryLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _categoryLabel.numberOfLines = 1;
    }
    return _categoryLabel;
}

@end
