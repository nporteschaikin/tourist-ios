//
//  ToursAPIDataSource.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "ToursDataSource.h"
#import "TouristSessionAPIRequest.h"

@class ToursDataSource;

@protocol ToursDataSourceDelegate

- (void)toursDataSourceDidUpdateTours:(ToursDataSource *)toursDataSource;

@end

@interface ToursAPIDataSource : ToursDataSource

@property (weak, nonatomic) id<ToursDataSourceDelegate> delegate;

- (id)initWithAPIRequest:(TouristSessionAPIRequest *)request NS_DESIGNATED_INITIALIZER;
- (void)performRequest;

@end
