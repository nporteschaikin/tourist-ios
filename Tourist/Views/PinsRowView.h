//
//  PinsRowView.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 4/1/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinsRowView : UIView

@property (strong, nonatomic, readonly) UILabel *nameLabel;
@property (strong, nonatomic, readonly) UILabel *categoryLabel;
@property (strong, nonatomic, readonly) UILabel *addressLabel;
@property (strong, nonatomic, readonly) UILabel *descriptionLabel;
@property (strong, nonatomic, readonly) UILabel *numberLabel;

@end
