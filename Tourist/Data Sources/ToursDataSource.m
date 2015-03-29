//
//  ToursDataSource.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "ToursDataSource.h"
#import "ToursTableViewCell.h"

@interface ToursDataSource ()

@property (strong, nonatomic) NSString *reuseIdentifier;

@end

@implementation ToursDataSource

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super init]) {
        self.reuseIdentifier = reuseIdentifier;
    }
    return self;
}

/*
 * UITableViewDataSource
 */

- (ToursTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToursTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
    
    /*
     * Get tour.
     */
    
    NSDictionary *tour = [self.tours objectAtIndex:indexPath.row];
    
    /*
     * Set up cell.
     */
    
    cell.headerView.nameLabel.text = [tour objectForKey:@"name"];
    cell.headerView.descriptionLabel.text = [tour objectForKey:@"description"];
    cell.headerView.pinsCount = [NSNumber numberWithInteger:[(NSArray *)[tour objectForKey:@"pins"] count]];
    
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
