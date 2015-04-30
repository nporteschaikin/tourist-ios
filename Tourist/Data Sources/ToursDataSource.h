//
//  ToursDataSource.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToursDataSource : NSObject <UITableViewDataSource>

@property (copy, nonatomic) NSArray *tours;

- (void)registerReuseIdentifiersForTableView:(UITableView *)tableView;

@end
