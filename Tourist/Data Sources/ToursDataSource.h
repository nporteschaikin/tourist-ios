//
//  ToursDataSource.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToursDataSource;

@protocol ToursDataSourceDelegate

- (void)toursDataSourceDidUpdateTours:(ToursDataSource *)toursDataSource;

@end

@interface ToursDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) id<ToursDataSourceDelegate> delegate;
@property (strong, nonatomic) NSArray *tours;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
