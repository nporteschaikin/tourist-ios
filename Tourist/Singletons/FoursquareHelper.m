//
//  FoursquareHelper.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "FoursquareHelper.h"

@implementation FoursquareHelper

+ (NSDictionary *)pinDictionaryFromFoursquareVenue:(NSDictionary *)venue {
    NSMutableDictionary *pin = [NSMutableDictionary dictionary];
    
    /*
     * Add name.
     */
    
    NSString *name = [venue objectForKey:@"name"];
    [pin setObject:name
            forKey:@"name"];
    
    /*
     * Add category.
     */
    
    NSArray *categories = [venue objectForKey:@"categories"];
    NSDictionary *category = [categories firstObject];
    if (category) {
        NSString *categoryName = [category objectForKey:@"name"];
        [pin setObject:categoryName
                forKey:@"category"];
    }
    
    /*
     * Add location.
     */
    
    NSDictionary *location = [venue objectForKey:@"location"];
    NSString *latitude = [location objectForKey:@"lat"];
    NSString *longitude = [location objectForKey:@"lng"];
    NSString *address = [location objectForKey:@"formattedAddress"];
    [pin setObject:@[longitude, latitude]
            forKey:@"location"];
    [pin setObject:address
            forKey:@"address"];
    
    return pin;
}

@end
