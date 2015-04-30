//
//  TourDataSource.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 4/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "TourDataSource.h"
#import "TourHeaderTableViewCell.h"
#import "PinsTableViewCell.h"
#import "TourDetailsTableViewCell.h"

@interface TourDataSource () <APIRequestDelegate>

@property (strong, nonatomic) TouristSessionAPIRequest *request;
@property (strong, nonatomic) NSDictionary *tour;
@property (strong, nonatomic) NSDictionary *user;
@property (strong, nonatomic) NSArray *pins;

@end

@implementation TourDataSource

static NSString * const PinsTableViewCellReuseIdentifier = @"PinsTableViewCellReuseIdentifier";
static NSString * const TourDetailsTableViewCellReuseIdentifier = @"TourDetailsTableViewCellReuseIdentifier";

- (instancetype)initWithAPIRequest:(TouristSessionAPIRequest *)request {
    if (self = [super init]) {
        self.request = request;
        self.request.delegate = self;
    }
    return self;
}

- (void)performRequest {
    [self.request sendRequest];
}

- (void)registerReuseIdentifiersForTableView:(UITableView *)tableView {
    [tableView registerClass:[PinsTableViewCell class]
      forCellReuseIdentifier:PinsTableViewCellReuseIdentifier];
    [tableView registerClass:[TourDetailsTableViewCell class]
      forCellReuseIdentifier:TourDetailsTableViewCellReuseIdentifier];
}

/*
 * APIRequestDelegate
 */

- (void)APIRequest:(APIRequest *)APIRequest successResponse:(NSURLResponse *)response data:(NSData *)data {
    self.tour = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions
                                                  error:nil];
    self.user = [self.tour objectForKey:@"user"];
    self.pins = [self.tour objectForKey:@"pins"];
    [self.delegate tourDataSourceDidFetchTour:self];
}

- (void)APIRequest:(APIRequest *)APIRequest error:(NSError *)error {
    
}

- (void)APIRequest:(APIRequest *)APIRequest failResponse:(NSURLResponse *)response data:(NSData *)data {
    
}

/*
 * UITableViewDataSource
 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    switch (section) {
        case TourDataSourceSectionHeader: {
            TourHeaderTableViewCell *cell = [[TourHeaderTableViewCell alloc] init];
            cell.nameLabel.text = [self.tour objectForKey:@"name"];
            cell.descriptionLabel.text = [self.tour objectForKey:@"description"];
            return cell;
        }
        case TourDataSourceSectionDetails: {
            TourDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TourDetailsTableViewCellReuseIdentifier];
            switch (row) {
                case TourDataSourceDetailsRowUser: {
                    cell.titleLabel.text = [self.user objectForKey:@"name"];
                    break;
                }
                default: {// TourDataSourceDetailsRowPins
                    cell.titleLabel.text = [NSString stringWithFormat:@"%d pin(s)", (int)self.pins.count];
                    break;
                }
            }
            [cell setNeedsUpdateConstraints];
            [cell updateConstraintsIfNeeded];
            return cell;
        }
        default: { // TourDataSourceSectionPins:
            PinsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PinsTableViewCellReuseIdentifier];
            NSDictionary *pin = [self.pins objectAtIndex:row];
            cell.nameLabel.text = [pin objectForKey:@"name"];
            cell.addressLabel.text = [[pin objectForKey:@"address"] componentsJoinedByString:@", "];
            cell.categoryLabel.text = [pin objectForKey:@"category"];
            cell.descriptionLabel.text = [pin objectForKey:@"description"];
            [cell setNeedsUpdateConstraints];
            [cell updateConstraintsIfNeeded];
            return cell;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case TourDataSourceSectionHeader: {
            return 1;
        }
        case TourDataSourceSectionDetails: {
            return 2;
        }
        default: { // TourDataSourceSectionPins:
            return self.pins.count;
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

@end
