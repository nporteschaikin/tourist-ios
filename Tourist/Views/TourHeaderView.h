//
//  TourHeaderView.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TourHeaderView : UIView

@property (strong, nonatomic, readonly) UILabel *nameLabel;
@property (strong, nonatomic, readonly) UILabel *descriptionLabel;
@property (strong, nonatomic, readonly) UILabel *userNameLabel;
@property (strong, nonatomic) NSNumber *pinsCount;

@end
