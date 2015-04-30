//
//  PinsDataSource.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinsDataSource : NSObject <UITableViewDataSource>

@property (copy, nonatomic) NSArray *pins;

- (void)registerReuseIdentifiersForTableView:(UITableView *)tableView;

@end
