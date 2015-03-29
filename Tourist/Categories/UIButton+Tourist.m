//
//  UIButton+Tourist.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "UIButton+Tourist.h"

@implementation UIButton (Tourist)

+ (UIButton *)touristTinyButton {
    UIButton *button = [[UIButton alloc] init];
    button.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    button.titleLabel.font = [UIFont fontWithName:@"Arial"
                                             size:14.0f];
    return button;
}

+ (UIButton *)touristTinyRoundedButton {
    UIButton *button = [self touristTinyButton];
    button.layer.cornerRadius = 3.0f;
    return button;
}

+ (UIButton *)touristLargeButton {
    UIButton *button = [[UIButton alloc] init];
    button.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
    button.titleLabel.font = [UIFont fontWithName:@"Arial"
                                             size:16.0f];
    return button;
}

@end
