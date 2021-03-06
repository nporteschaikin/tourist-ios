//
//  PinsTableViewCell.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/31/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinsTableViewCell : UITableViewCell

@property (strong, nonatomic, readonly) UILabel *nameLabel;
@property (strong, nonatomic, readonly) UILabel *categoryLabel;
@property (strong, nonatomic, readonly) UILabel *addressLabel;
@property (strong, nonatomic, readonly) UILabel *descriptionLabel;

@end
