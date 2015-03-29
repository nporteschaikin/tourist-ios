//
//  ToursAPIDataSource.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "ToursAPIDataSource.h"

@interface ToursAPIDataSource () <APIRequestDelegate>

@property (strong, nonatomic) TouristSessionAPIRequest *request;

@end

@implementation ToursAPIDataSource

- (id)initWithSessionAPIRequest:(TouristSessionAPIRequest *)request
                reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.request = request;
        self.request.delegate = self;
    }
    return self;
}

- (void)performRequest {
    
    /*
     * Send request
     */
    
    [self.request sendRequest];
}

/*
 * APIRequestDelegate
 */

- (void)APIRequest:(APIRequest *)APIRequest successResponse:(NSURLResponse *)response data:(NSData *)data {
    
    /*
     * Parse JSON.
     */
    
    NSArray *tours = [NSJSONSerialization JSONObjectWithData:data
                                                     options:kNilOptions
                                                       error:nil];
    
    /*
     * Set property.
     */
    
    self.tours = tours;
    
    /*
     * Send delegate message.
     */
    
    [self.delegate toursDataSourceDidUpdateTours:self];
    
}

- (void)APIRequest:(TouristSessionAPIRequest *)APIRequest failResponse:(NSURLResponse *)response data:(NSData *)data {
    
}

- (void)APIRequest:(TouristSessionAPIRequest *)APIRequest error:(NSError *)error {
    
}

@end
