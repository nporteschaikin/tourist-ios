//
//  FoursquareAPIRequest.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "FoursquareAPIRequest.h"
#import "Constants.h"

@implementation FoursquareAPIRequest

- (id)init {
    if (self = [super init]) {
        
        /*
         * Set base URL to Foursquare API
         */
        
        self.base = FoursquareAPIBase;        
    }
    return self;
}

- (void)sendRequest {
    
    
    /*
     * Add session manager as parameter.
     */
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithDictionary:self.params];
    [params setObject:FoursquareClientID
               forKey:@"client_id"];
    [params setObject:FoursquareClientSecret
               forKey:@"client_secret"];
    [params setObject:FoursquareVersionDate
               forKey:@"v"];
    self.params = params;
    
    [super sendRequest];
    
}

@end
