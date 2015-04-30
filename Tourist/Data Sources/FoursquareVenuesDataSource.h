//
//  FoursquareVenuesDataSource.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoursquareAPIRequest.h"

@class FoursquareVenuesDataSource;

@protocol FoursquareVenuesDataSourceDelegate

- (void)foursquareVenuesDataDidUpdate:(FoursquareVenuesDataSource *)dataSource;

@end

@interface FoursquareVenuesDataSource : NSObject <UITableViewDataSource>

@property (weak, nonatomic) id<FoursquareVenuesDataSourceDelegate> delegate;
@property (strong, nonatomic, readonly) NSArray *venues;

- (id)initWithFoursquareAPIRequest:(FoursquareAPIRequest *)request;
- (void)registerReuseIdentifiersForTableView:(UITableView *)tableView;
- (void)performRequest;

@end
