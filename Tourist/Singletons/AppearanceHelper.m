//
//  AppearanceHelper.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "AppearanceHelper.h"
#import "UIColor+Tourist.h"
#import "Constants.h"

@implementation AppearanceHelper

+ (void)customizeAppearance {
    [[UINavigationBar appearance] setBarTintColor:[UIColor touristRedColorAlpha:1]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                           NSFontAttributeName:[UIFont fontWithName:TouristDefaultBoldFontName
                                                                                               size:17.0f]}];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                          NSFontAttributeName:[UIFont fontWithName:TouristDefaultFontName
                                                                                              size:17.0f]}
                                                forState:UIControlStateNormal];
    [[UITextField appearance] setFont:[UIFont fontWithName:TouristDefaultFontName
                                                      size:17.0f]];
    [[UILabel appearanceWhenContainedIn:[UIButton class], nil] setFont:[UIFont fontWithName:TouristDefaultFontName
                                                                                       size:17.0f]];
}

@end
