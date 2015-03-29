//
//  TouristSessionAPIRequest.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "TouristSessionAPIRequest.h"

@interface TouristSessionAPIRequest ()

@property (strong, nonatomic) Session *session;

@end

@implementation TouristSessionAPIRequest

- (id)initWithSession:(Session *)session {
    if (self = [super init]) {
        self.session = session;
    }
    return self;
}

- (void)sendRequest {
    
    /*
     * Add session manager as parameter.
     */
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithDictionary:self.params];
    [params setObject:self.session.sessionToken
               forKey:@"token"];
    self.params = params;
    
    /*
     * Send request
     */
    
    [super sendRequest];
}

@end
