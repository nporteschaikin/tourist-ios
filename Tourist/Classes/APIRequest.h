//
//  APIRequest.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APIRequest;

@protocol APIRequestDelegate

- (void)APIRequest:(APIRequest *)APIRequest
   successResponse:(NSURLResponse *)response
              data:(NSData *)data;

- (void)APIRequest:(APIRequest *)APIRequest
      failResponse:(NSURLResponse *)response
              data:(NSData *)data;

- (void)APIRequest:(APIRequest *)APIRequest
             error:(NSError *)error;

@end

@interface APIRequest : NSObject

@property (weak, nonatomic) id<APIRequestDelegate> delegate;
@property (copy, nonatomic) NSString *base;
@property (copy, nonatomic) NSString *endpoint;
@property (copy, nonatomic) NSString *method;
@property (strong, nonatomic) NSDictionary *params;
@property (strong, nonatomic) NSDictionary *body;
@property (strong, nonatomic, readonly) NSMutableURLRequest *request;

- (void)sendRequest;

@end
