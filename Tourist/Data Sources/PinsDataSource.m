//
//  PinsDataSource.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "PinsDataSource.h"

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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
    
    /*
     * Populate cells.
     */
    
    NSDictionary *pin = [self.pins objectAtIndex:indexPath.row];
    [self.delegate configureCell:cell
                          forPin:pin];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
