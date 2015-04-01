//
//  UIColor+Tourist.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "UIColor+Tourist.h"

@implementation UIColor (Tourist)

+ (UIColor *)touristRedColorAlpha:(float)alpha {
    return [UIColor colorWithRed:0.729
                           green:0.055
                            blue:0.098
                           alpha:1];
}

+ (UIColor *)touristDarkRedColorAlpha:(float)alpha {
    return [UIColor colorWithRed:0.298
                           green:0.102
                            blue:0.102
                           alpha:alpha];
}

+ (UIColor *)touristYellowColorAlpha:(float)alpha {
    return [UIColor colorWithRed:0.965
                           green:0.898
                            blue:0.608
                           alpha:alpha];
}

+ (UIColor *)touristLightYellowColorAlpha:(float)alpha {
    return [UIColor colorWithRed:0.988
                           green:0.984
                            blue:0.886
                           alpha:alpha];
}

+ (UIColor *)touristLightGrayColorAlpha:(float)alpha {
    return [UIColor colorWithWhite:0.8
                             alpha:alpha];
}

@end
