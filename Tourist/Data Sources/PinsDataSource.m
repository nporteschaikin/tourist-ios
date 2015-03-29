//
//  PinsDataSource.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "PinsDataSource.h"
#import "PinsTableViewCell.h"

@interface PinsDataSource ()

@property (strong, nonatomic) NSString *reuseIdentifier;

@end

@implementation PinsDataSource

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super init]) {
        self.reuseIdentifier = reuseIdentifier;
    }
    return self;
}

/*
 * UITableViewDataSource
 */

- (PinsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PinsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
    if (cell == nil) {
        cell = [[PinsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:self.reuseIdentifier];
    }
    
    /*
     * Populate cells.
     */
    
    NSDictionary *pin = [self.pins objectAtIndex:indexPath.row];
    cell.nameLabel.text = [pin objectForKey:@"name"];
    cell.addressLabel.text = [[pin objectForKey:@"address"] componentsJoinedByString:@", "];
    cell.categoryLabel.text = [pin objectForKey:@"category"];
    
    NSString *description = [pin objectForKey:@"description"];
    if (description) {
        cell.descriptionLabel.text = description;
    } else {
        cell.descriptionLabel.text = nil;
    }
    
    /*
     * Update constraints.
     */
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pins.count;
}

@end
