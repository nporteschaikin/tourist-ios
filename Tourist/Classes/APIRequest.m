//
//  APIRequest.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "APIRequest.h"
#import "Constants.h"

@interface APIRequest ()

@property (strong, nonatomic) NSMutableURLRequest *request;

@end

@implementation APIRequest

+ (NSOperationQueue *)operationQueue {
    static NSOperationQueue *operationQueue;
    if (!operationQueue) {
        operationQueue = [[NSOperationQueue alloc] init];
    }
    return operationQueue;
}

- (void)sendRequest {
    
    /*
     * Create URL.
     */
    
    NSURL *baseURL = [NSURL URLWithString:self.base];
    NSURL *url = [NSURL URLWithString:self.endpoint
                        relativeToURL:baseURL];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:url
                                               resolvingAgainstBaseURL:YES];
    
    if (self.params) {
        
        /*
         * Add parameters.
         */
        
        NSMutableArray *queryItems = [NSMutableArray array];
        NSURLQueryItem *queryItem;
        id queryValue;
        for (NSString *key in self.params) {
            queryValue = [self.params objectForKey:key];
            queryItem = [NSURLQueryItem queryItemWithName:key
                                                    value:queryValue];
            [queryItems addObject:queryItem];
        }
        components.queryItems = queryItems;
        url = [components URL];
    }
    
    /*
     * Create request.
     */
    
    self.request.URL = url;
    
    self.request.HTTPMethod = self.method;
    [self.request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    if (self.body) {
        self.request.HTTPBody = [NSJSONSerialization dataWithJSONObject:self.body
                                                                options:NSJSONWritingPrettyPrinted
                                                                  error:nil];
    }
    
    /*
     * Send request asynchronously.
     */
    
    NSOperationQueue *operationQueue = [[self class] operationQueue];
    [NSURLConnection sendAsynchronousRequest:self.request
                                       queue:operationQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                   if (connectionError) {
                                       [self.delegate APIRequest:self
                                                           error:connectionError];
                                   } else if ([httpResponse statusCode] != 200) {
                                       [self.delegate APIRequest:self
                                                    failResponse:response
                                                            data:data];
                                   } else {
                                       [self.delegate APIRequest:self
                                                 successResponse:response
                                                            data:data];
                                   }
                               });
                           }];
}

- (NSURLRequest *)request {
    if (!_request) {
        self.request = [[NSMutableURLRequest alloc] init];
    }
    return _request;
}

- (NSString *)method {
    if (!_method) {
        _method = @"GET";
    }
    return _method;
}

@end
