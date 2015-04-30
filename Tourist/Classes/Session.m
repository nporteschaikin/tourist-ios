//
//  Session.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "Session.h"
#import "TouristAPIRequest.h"
#import "Constants.h"

@interface Session () <APIRequestDelegate>

@property (copy, nonatomic) NSString *sessionToken;
@property (strong, nonatomic) NSDictionary *user;
@property (strong, nonatomic) APIRequest *request;

@end

@implementation Session

- (id)init {
    if (self = [super init]) {
        self.request = [[TouristAPIRequest alloc] init];
        self.request.delegate = self;
    }
    return self;
}

- (id)initWithFacebookAccessToken:(NSString *)facebookAccessToken {
    if (self = [self init]) {
        
        /*
         * Add Facebook token to request body.
         */
        
        self.request.body = @{@"fbAccessToken": facebookAccessToken};
        
    }
    return self;
}

- (id)initWithSessionToken {
    if (self = [self init]) {
        
        /*
         * Get session token from defaults.
         */
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *sessionToken = [defaults objectForKey:SessionTokenUserDefaultsKey];
        
        /*
         * Add to request body.
         */
        
        if (sessionToken) {
            self.request.body = @{@"sessionToken": sessionToken};
        }
        
    }
    return self;
}

- (void)requestSession {
    if (self.request.body) {
        
        /*
         * Set up request
         */
        
        self.request.method = @"POST";
        self.request.endpoint = IOAuthEndpoint;
        
        /*
         * Send request
         */
        
        [self.request sendRequest];
        
    } else {
        
        /*
         * Send failed message delegate
         */
        
        [self.delegate sessionFailed:self];
        
    }
}

/*
 * APIRequestDelegate
 */

- (void)APIRequest:(APIRequest *)APIRequest successResponse:(NSURLResponse *)response data:(NSData *)data {
    
    /*
     * Parse JSON
     */
    
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data
                                                           options:kNilOptions
                                                             error:nil];
    NSString *sessionToken = [result objectForKey:@"sessionToken"];
    NSDictionary *user = [result objectForKey:@"user"];
    
    /*
     * Set properties.
     */
    
    self.sessionToken = sessionToken;
    self.user = user;
    
    /*
     * Set user defaults
     */
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:sessionToken forKey:SessionTokenUserDefaultsKey];
    
    /*
     * Send delegate method.
     */
    
    [self.delegate sessionCreated:self];
    
}

- (void)APIRequest:(APIRequest *)APIRequest failResponse:(NSURLResponse *)response data:(NSData *)data {
    [self.delegate sessionFailed:self];
}

- (void)APIRequest:(APIRequest *)APIRequest error:(NSError *)error {
    [self.delegate session:self
                     error:error];
}

@end
