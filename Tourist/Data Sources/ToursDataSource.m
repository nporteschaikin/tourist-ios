//
//  ToursDataSource.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "ToursDataSource.h"
#import "ToursTableViewCell.h"

static NSString * const ToursTableViewCellReuseIdentifier = @"ToursTableViewCellReuseIdentifier";

@implementation ToursDataSource

- (void)registerReuseIdentifiersForTableView:(UITableView *)tableView {
    [tableView registerClass:[ToursTableViewCell class]
      forCellReuseIdentifier:ToursTableViewCellReuseIdentifier];
}

/*
 * UITableViewDataSource
 */

- (ToursTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToursTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ToursTableViewCellReuseIdentifier];
    
    /*
     * Get tour.
     */
    
    NSDictionary *tour = [self.tours objectAtIndex:indexPath.row];
    
    /*
     * Set up cell.
     */
    
    cell.nameLabel.text = [tour objectForKey:@"name"];
    cell.descriptionLabel.text = [tour objectForKey:@"description"];
    
    /*
     * Update constraints.
     */
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tours.count;
}

@end
