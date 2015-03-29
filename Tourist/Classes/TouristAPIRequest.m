//
//  TouristAPIRequest.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "TouristAPIRequest.h"
#import "Constants.h"

@implementation TouristAPIRequest

- (id)init {
    if (self = [super init]) {
        
        /*
         * Set base URL to Tourist API
         */
        
        self.base = IOBaseURL;
        
    }
    return self;
}

@end
