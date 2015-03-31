//
//  ToursNearbyViewController.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "ToursNearbyViewController.h"
#import "ToursAPIDataSource.h"
#import "Constants.h"
#import <CoreLocation/CoreLocation.h>

@interface ToursNearbyViewController () <ToursDataSourceDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) ToursAPIDataSource *dataSource;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ToursNearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * Ask for location.
     */
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    /*
     * Add title
     */
    
    self.navigationItem.title = @"Nearby";
    
    /*
     * Add refresh control
     */
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self
                       action:@selector(handleRefreshControl:)
             forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;

}

- (void)handleRefreshControl:(UIRefreshControl *)refreshControl {
    
    /*
     * Perform fetch.
     */
    
    if (self.dataSource) {
        [self.dataSource performRequest];
    }
    
}

/*
 * CLLocationManager
 */

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

/*
 * CLLocationManagerDelegate
 */

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    /*
     * Get first location
     */
    
    CLLocation *location = [locations firstObject];
    
    /*
     * Create request
     */
    
    TouristSessionAPIRequest *request = [[TouristSessionAPIRequest alloc] initWithSession:self.session];
    request.endpoint = IOToursNearEndpoint;
    
    /*
     * Add lat-lng to request.
     */
    
    NSString *latitudeString = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
    NSString *longitudeString = [NSString stringWithFormat:@"%f", location.coordinate.longitude];
    request.params = @{@"latitude": latitudeString,
                       @"longitude": longitudeString};
    
    /*
     * Set up data source.
     */
    
    self.dataSource = [[ToursAPIDataSource alloc] initWithSessionAPIRequest:request
                                                            reuseIdentifier:self.reuseIdentifier];
    self.dataSource.delegate = self;
    self.tableView.dataSource = self.dataSource;
    
    /*
     * Perform fetch.
     */
    
    [self.dataSource performRequest];
    
    /*
     * Stop updating location.
     */
    
    [self.locationManager stopUpdatingLocation];
}

/*
 * ToursDataSourceDelegate
 */

- (void)toursDataSourceDidUpdateTours:(ToursDataSource *)toursDataSource {
    
    /*
     * Reload table.
     */
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                  withRowAnimation:UITableViewRowAnimationFade];
    
    /*
     * End refreshing if it's on.
     */
    
    [self.refreshControl endRefreshing];
    
}

@end
