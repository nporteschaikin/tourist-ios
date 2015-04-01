//
//  PinEditorViewController.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "PinEditorViewController.h"
#import "PinDetailsEditorView.h"
#import "FoursquareVenuesTableViewCell.h"
#import "FoursquareVenuesDataSource.h"
#import "FoursquareHelper.h"
#import "UIColor+Tourist.h"
#import <CoreLocation/CoreLocation.h>

@interface PinEditorViewController () <UINavigationBarDelegate, UISearchBarDelegate, UITableViewDelegate, FoursquareVenuesDataSourceDelegate, CLLocationManagerDelegate, PinDetailsEditorViewDelegate>

@property (strong, nonatomic) UINavigationBar *navigationBar;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) PinDetailsEditorView *detailsEditorView;
@property (strong, nonatomic) FoursquareVenuesDataSource *dataSource;
@property (strong, nonatomic) FoursquareAPIRequest *request;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
@property (strong, nonatomic) NSDictionary *pin;

@end

@implementation PinEditorViewController

NSString * const pinEditorViewControllerReuseIdentifier = @"pinEditorViewControllerReuseIdentifier";

- (id)init {
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.navigationBar];
        [self.view addSubview:self.searchBar];
        [self.view addSubview:self.tableView];
        [self.view addSubview:self.detailsEditorView];
        [self setupConstraints];
        [self setupGestureRecognizers];
    }
    return self;
}

- (void)setupConstraints {
    
    /*
     * navigationBar constraints
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.navigationBar
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.navigationBar
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.navigationBar
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:[UIApplication sharedApplication].statusBarFrame.size.height]];
    
    /*
     * searchBar constraints
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.searchBar
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.navigationBar
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.searchBar
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.searchBar
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:0]];
    
    /*
     * tableView constraints
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.searchBar
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
    
    /*
     * detailsEditorView constraints
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.detailsEditorView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.searchBar
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.detailsEditorView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.detailsEditorView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.detailsEditorView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * Get latest location
     */
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
}

- (void)setupGestureRecognizers {
    
    /*
     * Swipe up gesture
     */
    
    UISwipeGestureRecognizer *swipeUpGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(handleSwipeUpGesture)];
    swipeUpGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUpGesture];
    
}

- (void)handleSwipeUpGesture {
    
    /*
     * Resign first responder.
     */
    
    [self.view endEditing:YES];
}

- (UINavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[UINavigationBar alloc] init];
        _navigationBar.translatesAutoresizingMaskIntoConstraints = NO;
        _navigationBar.translucent = NO;
        _navigationBar.delegate = self;
        
        /*
         * Create navigation item
         */
        UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
        navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                         target:self
                                                                                         action:@selector(dismissViewController)];
        navigationItem.title = @"Add Pin";
        
        /*
         * Push and size
         */
        
        [_navigationBar pushNavigationItem:navigationItem
                                  animated:YES];
        [_navigationBar sizeToFit];
    }
    return _navigationBar;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.dataSource = self.dataSource;
        _tableView.delegate = self;
        [_tableView registerClass:[FoursquareVenuesTableViewCell class]
           forCellReuseIdentifier:pinEditorViewControllerReuseIdentifier];
    }
    return _tableView;
}

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

- (FoursquareVenuesDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[FoursquareVenuesDataSource alloc] initWithFoursquareAPIRequest:self.request
                                                                       reuseIdentifier:pinEditorViewControllerReuseIdentifier];
        _dataSource.delegate = self;
    }
    return _dataSource;
}

- (FoursquareAPIRequest *)request {
    if (!_request) {
        _request = [[FoursquareAPIRequest alloc] init];
        _request.endpoint = @"venues/search";
    }
    return _request;
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.translatesAutoresizingMaskIntoConstraints = NO;
        _searchBar.delegate = self;
        [_searchBar sizeToFit];
    }
    return _searchBar;
}

- (PinDetailsEditorView *)detailsEditorView {
    if (!_detailsEditorView) {
        _detailsEditorView = [[PinDetailsEditorView alloc] init];
        _detailsEditorView.delegate = self;
        _detailsEditorView.translatesAutoresizingMaskIntoConstraints = NO;
        _detailsEditorView.hidden = YES;
        _detailsEditorView.backgroundColor = [UIColor touristLightGrayColorAlpha:1];
    }
    return _detailsEditorView;
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    if (bar == self.navigationBar) {
        return UIBarPositionTopAttached;
    }
    return UIBarPositionTop;
}

- (void)presentDetailsEditorView {
    
    /*
     * Set details editor view labels
     */
    
    self.detailsEditorView.venueView.nameLabel.text = [self.pin objectForKey:@"name"];
    self.detailsEditorView.venueView.categoryLabel.text = [self.pin objectForKey:@"category"];
    self.detailsEditorView.venueView.addressLabel.text = [[self.pin objectForKey:@"address"] componentsJoinedByString:@", "];
    
    /*
     * hide with transform/opacity
     */
    
    self.detailsEditorView.hidden = NO;
    self.detailsEditorView.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height);
    self.detailsEditorView.alpha = 0.0f;
    
    /*
     * animate
     */
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         self.detailsEditorView.transform = CGAffineTransformMakeTranslation(0, 0);
                         self.detailsEditorView.alpha = 1.0f;
                     }];
    
}

- (void)dismissDetailsEditorView {
    
    /*
     * animate
     */
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         self.detailsEditorView.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height);
                         self.detailsEditorView.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         self.detailsEditorView.hidden = YES;
                     }];
    
}

- (void)dismissViewController {
    [self.delegate dismissPinEditorViewController:self];
}

- (void)query {
    
    if (![self.searchBar.text isEqualToString:@""] && self.currentLocation) {
    
        /*
         * Set request
         */
        
        NSString *currentLocationStr = [NSString stringWithFormat:@"%f,%f",
                                        self.currentLocation.coordinate.latitude,
                                        self.currentLocation.coordinate.longitude];
        self.request.params = @{@"query": self.searchBar.text,
                                @"ll": currentLocationStr};
        
        /*
         * Perform request
         */
    
        [self.dataSource performRequest];
        
    }
    
}

/*
 * Search bar delegate
 */

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    /*
     * Execute query.
     */
    
    [self query];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    /*
     * Hide details editor view controller.
     */
    
    [self dismissDetailsEditorView];
}

/*
 * Data source delegate
 */

- (void)foursquareVenuesDataDidUpdate:(FoursquareVenuesDataSource *)dataSource {
    [self.tableView reloadData];
}

/*
 * Location manager delegate
 */

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    /*
     * Get first location and
     * set as current location.
     */
    
    CLLocation *location = [locations firstObject];
    self.currentLocation = location;
    
    /*
     * Stop updating location
     */
    
    [self.locationManager stopUpdatingLocation];
    
    /*
     * Run query.
     */
    
    [self query];
}

/*
 * Table view delegate
 */

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /* 
     * Set venue in pin.
     */
    
    NSDictionary *venue = [self.dataSource.venues objectAtIndex:indexPath.row];
    NSMutableDictionary *pin = [NSMutableDictionary dictionaryWithDictionary:self.pin];
    NSDictionary *pinFromVenue = [FoursquareHelper pinDictionaryFromFoursquareVenue:venue];
    [pin addEntriesFromDictionary:pinFromVenue];
    self.pin = pin;
    
    /*
     * Make search bar inactive.
     */
    
    [self.searchBar resignFirstResponder];
    self.searchBar.text = nil;
    
    /*
     * Show details editor view.
     */
    
    [self presentDetailsEditorView];
}

/*
 * Pin details editor view delegate
 */

- (void)pinDetailsEditorView:(PinDetailsEditorView *)view
                      action:(PinDetailsEditorViewAction)action {
    
    /*
     * Duplicate pin dictionary to make mutable.
     */
    
    NSMutableDictionary *pin = [NSMutableDictionary dictionaryWithDictionary:self.pin];
    
    /*
     * Add description to pin.
     */
    
    NSString *description = view.descriptionTextView.text;
    [pin setObject:description
            forKey:@"description"];
    
    /*
     * Send delegate message.
     */

    [self.delegate pinEditorViewController:self
                                   sentPin:pin];
    
}

@end
