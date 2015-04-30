//
//  FoursquareVenuesTableViewCell.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoursquareVenuesTableViewCell : UITableViewCell

@property (strong, nonatomic, readonly) UILabel *nameLabel;
@property (strong, nonatomic, readonly) UILabel *categoryLabel;
@property (strong, nonatomic, readonly) UILabel *addressLabel;

@end
