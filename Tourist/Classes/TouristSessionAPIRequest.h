//
//  TouristSessionAPIRequest.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "TouristAPIRequest.h"
#import "Session.h"

@interface TouristSessionAPIRequest : TouristAPIRequest

- (id)initWithSession:(Session *)session;

@end
