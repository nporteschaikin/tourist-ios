//
//  TourDataSource.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 4/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouristSessionAPIRequest.h"

typedef NS_ENUM(NSInteger, TourDataSourceSection) {
    TourDataSourceSectionHeader,
    TourDataSourceSectionDetails,
    TourDataSourceSectionPins
};

@class TourDataSource;

@protocol TourDataSourceDelegate

- (void)tourDataSourceDidFetchTour:(TourDataSource *)tourDataSource;

@end

@interface TourDataSource : NSObject <UITableViewDataSource>

@property (weak, nonatomic) id<TourDataSourceDelegate> delegate;
@property (strong, nonatomic, readonly) NSDictionary *tour;

- (id)initWithAPIRequest:(TouristSessionAPIRequest *)request NS_DESIGNATED_INITIALIZER;
- (void)registerReuseIdentifiersForTableView:(UITableView *)tableView;
- (void)performRequest;

@end
