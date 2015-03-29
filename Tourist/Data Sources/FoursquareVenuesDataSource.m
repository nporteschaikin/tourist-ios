//
//  FoursquareVenuesDataSource.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "FoursquareVenuesDataSource.h"
#import "FoursquareVenuesTableViewCell.h"

@interface FoursquareVenuesDataSource () <APIRequestDelegate>

@property (strong, nonatomic) NSString *reuseIdentifier;
@property (strong, nonatomic) FoursquareAPIRequest *request;
@property (strong, nonatomic) NSArray *venues;

@end

@implementation FoursquareVenuesDataSource

- (id)initWithFoursquareAPIRequest:(FoursquareAPIRequest *)request
                   reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super init]) {
        self.request = request;
        self.request.delegate = self;
        self.venues = [NSArray array];
    }
    return self;
}

- (void)performRequest {
    
    /*
     * Send request
     */
    
    [self.request sendRequest];
}

/*
 * APIRequestDelegate
 */

- (void)APIRequest:(APIRequest *)APIRequest successResponse:(NSURLResponse *)response data:(NSData *)data {
    
    /*
     * Parse JSON.
     */
    
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data
                                                           options:kNilOptions
                                                             error:nil];
    NSDictionary *resultResponse = [result objectForKey:@"response"];
    NSArray *venues = [resultResponse objectForKey:@"venues"];
    
    /*
     * Set property.
     */
    
    self.venues = venues;
    
    /*
     * Send delegate message.
     */
    
    [self.delegate foursquareVenuesDataDidUpdate:self];
    
}

- (void)APIRequest:(FoursquareAPIRequest *)APIRequest failResponse:(NSURLResponse *)response data:(NSData *)data {
    
}

- (void)APIRequest:(FoursquareAPIRequest *)APIRequest error:(NSError *)error {
    
}

/*
 * UITableViewDataSource
 */

- (FoursquareVenuesTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoursquareVenuesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
    if (cell == nil) {
        cell = [[FoursquareVenuesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:self.reuseIdentifier];
    }
    
    /*
     * Populate cells.
     */
    
    NSDictionary *venue = [self.venues objectAtIndex:indexPath.row];
    cell.venueView.nameLabel.text = [venue objectForKey:@"name"];
    cell.venueView.addressLabel.text = [[[venue objectForKey:@"location"] objectForKey:@"formattedAddress"] componentsJoinedByString:@", "];
    cell.venueView.categoryLabel.text = [[[venue objectForKey:@"categories"] firstObject] objectForKey:@"name"];
    
    /*
     * Update constraints.
     */
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.venues.count;
}

@end
