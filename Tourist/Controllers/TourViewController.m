//
//  TourViewController.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/31/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "TourViewController.h"
#import "TourDataSource.h"

@interface TourViewController () <TourDataSourceDelegate>

@property (strong, nonatomic) TourDataSource *dataSource;

@end

@implementation TourViewController

- (id)initWithAPIRequest:(TouristSessionAPIRequest *)request {
    if (self = [super init]) {
        self.dataSource = [[TourDataSource alloc] initWithAPIRequest:request];
        self.dataSource.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.dataSource = self.dataSource;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;
    
    [self.dataSource registerReuseIdentifiersForTableView:self.tableView];
    [self.dataSource performRequest];
}

/*
 * TourDataSourceDelegate
 */

- (void)tourDataSourceDidFetchTour:(TourDataSource *)tourDataSource {
    [self.tableView reloadData];
}

/*
 * UITableViewDelegate
 */

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    switch (section) {
        case TourDataSourceSectionHeader:
            return 250.f;
        default:
            return UITableViewAutomaticDimension;
    }
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSInteger section = indexPath.section;
//    switch (section) {
//        case TourDataSourceSectionHeader:
//            return 250.f;
//        default:
//            return 500.f;
//    }
//}

@end
