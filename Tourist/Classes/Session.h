//
//  Session.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Session;

@protocol SessionDelegate

- (void)sessionCreated:(Session *)session;
- (void)sessionFailed:(Session *)session;
- (void)session:(Session *)session
          error:(NSError *)error;

@end

@interface Session : NSObject

@property (strong, nonatomic) id<SessionDelegate> delegate;
@property (copy, nonatomic, readonly) NSString *sessionToken;
@property (strong, nonatomic, readonly) NSDictionary *user;

- (id)initWithFacebookAccessToken:(NSString *)facebookAccessToken;
- (id)initWithSessionToken;
- (void)requestSession;

@end
