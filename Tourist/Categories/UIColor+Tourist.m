//
//  UIColor+Tourist.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "UIColor+Tourist.h"

@implementation UIColor (Tourist)

+ (UIColor *)touristBlueColorAlpha:(float)alpha {
    return [UIColor colorWithRed:0
                           green:0
                            blue:1
                           alpha:alpha];
}

+ (UIColor *)touristLightGreyColorAlpha:(float)alpha {
    return [UIColor colorWithRed:0.945
                           green:0.945
                            blue:0.945
                           alpha:alpha];
}

+ (UIColor *)touristGreyColorAlpha:(float)alpha {
    return [UIColor colorWithRed:0.6
                           green:0.6
                            blue:0.6
                           alpha:alpha];
}

@end
