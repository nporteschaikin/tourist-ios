//
//  FoursquareHelper.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoursquareHelper : NSObject

+ (NSDictionary *)pinDictionaryFromFoursquareVenue:(NSDictionary *)venue;

@end
