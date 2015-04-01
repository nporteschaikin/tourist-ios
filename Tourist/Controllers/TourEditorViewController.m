//
//  TourEditorViewController.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "TourEditorViewController.h"
#import "TourEditorHeaderView.h"
#import "PinsEditorTableViewCell.h"
#import "PinEditorViewController.h"
#import "PinsDataSource.h"
#import "TouristSessionAPIRequest.h"
#import "UIButton+Tourist.h"
#import "UIColor+Tourist.h"
#import "Constants.h"

@interface TourEditorViewController () <UINavigationControllerDelegate, PinEditorViewControllerDelegate, APIRequestDelegate, PinsDataSourceDelegate>

@property (strong, nonatomic) Session *session;
@property (strong, nonatomic) PinEditorViewController *pinEditorViewController;
@property (strong, nonatomic) TourEditorHeaderView *headerView;
@property (strong, nonatomic) UIButton *saveButton;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIToolbar *toolbar;
@property (strong, nonatomic) PinsDataSource *dataSource;
@property (strong, nonatomic) TouristSessionAPIRequest *request;

@end

@implementation TourEditorViewController

NSString * const tourPinsEditorViewControllerReuseIdentifier = @"tourPinsEditorViewControllerReuseIdentifier";

- (id)initWithSession:(Session *)session {
    if (self = [super init]) {
        self.session = session;
        
        /*
         * Style local view
         */
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        /*
         * Add subviews
         */
        
        [self.view addSubview:self.headerView];
        [self.view insertSubview:self.tableView
                    aboveSubview:self.headerView];
        [self.view insertSubview:self.toolbar
                    aboveSubview:self.headerView];
        [self.view addSubview:self.saveButton];
        
        /*
         * Setup constraints & gesture 
         * recognizers.
         */
        
        [self setupConstraints];
        [self setupGestureRecognizers];
    }
    return self;
}

- (void)setupConstraints {
    
    /*
     * toolbar
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.toolbar
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.topLayoutGuide
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:9]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.toolbar
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:9]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.toolbar
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:-9]];
    
    /*
     * headerView
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.tableView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.topLayoutGuide
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:0]];
    
    /*
     * tableView
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.saveButton
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.6
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
    
    /*
     * saveButton
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.saveButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.saveButton
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.saveButton
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:0]];
}

- (void)setupGestureRecognizers {
    
    /*
     * Tap table view gesture
     */
    
    UITapGestureRecognizer *tapTableViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(handleTapTableViewGesture)];
    [self.tableView addGestureRecognizer:tapTableViewGesture];
    
}

- (void)handleSwipeUpGesture {
    
    /*
     * Resign first responder.
     */
    
    [self.view endEditing:YES];
    
}

- (void)handleTapTableViewGesture {
    
    /*
     * Resign first responder.
     */
    
    [self.view endEditing:YES];
    
}

- (void)presentPinEditorViewController {
    
    /*
     * Create pin editor view controller.
     */
    
    self.pinEditorViewController = [[PinEditorViewController alloc] init];
    self.pinEditorViewController.delegate = self;
    
    /*
     * Display pin editor view controller.
     */
    
    [self presentViewController:self.pinEditorViewController
                       animated:YES
                     completion:nil];
    
}

- (UIButton *)saveButton {
    if (!_saveButton) {
        _saveButton = [UIButton touristLargeButton];
        _saveButton.translatesAutoresizingMaskIntoConstraints = NO;
        _saveButton.backgroundColor = [UIColor touristBlueColorAlpha:1];
        [_saveButton setTitle:@"Save"
                     forState:UIControlStateNormal];
        [_saveButton setTitleColor:[UIColor whiteColor]
                          forState:UIControlStateNormal];
        [_saveButton addTarget:self
                        action:@selector(handleSaveButtonTouchDown)
              forControlEvents:UIControlEventTouchDown];
    }
    return _saveButton;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.dataSource = self.dataSource;
        [_tableView registerClass:[PinsEditorTableViewCell class]
           forCellReuseIdentifier:tourPinsEditorViewControllerReuseIdentifier];
    }
    return _tableView;
}

- (PinsDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[PinsDataSource alloc] initWithReuseIdentifier:tourPinsEditorViewControllerReuseIdentifier];
        _dataSource.delegate = self;
    }
    return _dataSource;
}

- (TourEditorHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[TourEditorHeaderView alloc] init];
        _headerView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _headerView;
}

- (void)handleSaveButtonTouchDown {
    NSDictionary *tour = [NSMutableDictionary dictionary];
    
    /*
     * Set name
     */
    
    NSString *name = self.headerView.nameTextField.text;
    [tour setValue:name
            forKey:@"name"];
    
    /*
     * Set description
     */
    
    NSString *description = self.headerView.descriptionTextField.text;
    [tour setValue:description
            forKey:@"description"];
    
    /*
     * Set pins
     */
    NSArray *pins = self.dataSource.pins;
    [tour setValue:pins
            forKey:@"pins"];
    
    /*
     * Create request
     */
    
    self.request = [[TouristSessionAPIRequest alloc] initWithSession:self.session];
    self.request.delegate = self;
    self.request.endpoint = IOToursCreateEndpoint;
    self.request.method = @"POST";
    self.request.body = tour;
    
    /*
     * Send request.
     */
    
    [self.request sendRequest];
}

- (UIToolbar *)toolbar {
    if (!_toolbar) {
        _toolbar = [[UIToolbar alloc] init];
        _toolbar.translatesAutoresizingMaskIntoConstraints = NO;
        _toolbar.barTintColor = [UIColor clearColor];
        _toolbar.tintColor = [UIColor whiteColor];
        _toolbar.translucent = NO;
        _toolbar.items = @[
                           [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                         target:self
                                                                         action:@selector(dismissViewController)],
                           [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                         target:nil
                                                                         action:nil],
                           [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(presentPinEditorViewController)]
                           ];
    }
    return _toolbar;
}

- (void)dismissViewController {
    [self.delegate dismissTourEditorViewController];
}

/*
 * Pin editor view controller delegate.
 */

- (void)dismissPinEditorViewController:(PinEditorViewController *)controller {
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 
                                 /*
                                  * Remove from memory.
                                  */
                                 
                                 self.pinEditorViewController = nil;
                             }];
}

- (void)pinEditorViewController:(PinEditorViewController *)controller
                        sentPin:(NSDictionary *)pin {
    
    /*
     * Duplicate pins to make it mutable.
     */
    
    NSMutableArray *pins = [NSMutableArray arrayWithArray:self.dataSource.pins];
    
    /*
     * Add pin.
     */
    
    [pins addObject:pin];
    
    /*
     * Set pins, dismiss modal, and reload table.
     */
    
    self.dataSource.pins = pins;
    [self dismissPinEditorViewController:controller];
    [self.tableView reloadData];
    
}

/*
 * Request delegate
 */

- (void)APIRequest:(APIRequest *)APIRequest successResponse:(NSURLResponse *)response data:(NSData *)data {
    
    /*
     * Close
     */
    
    [self dismissViewController];
    
}

- (void)APIRequest:(APIRequest *)APIRequest failResponse:(NSURLResponse *)response data:(NSData *)data {
    
}

- (void)APIRequest:(APIRequest *)APIRequest error:(NSError *)error {

}

/*
 * PinDataSourceDelegate
 */

- (void)configureCell:(PinsEditorTableViewCell *)cell forPin:(NSDictionary *)pin {
    cell.nameLabel.text = [pin objectForKey:@"name"];
    cell.addressLabel.text = [[pin objectForKey:@"address"] componentsJoinedByString:@", "];
    cell.categoryLabel.text = [pin objectForKey:@"category"];
    
    NSString *description = [pin objectForKey:@"description"];
    if (description) {
        cell.descriptionLabel.text = description;
    } else {
        cell.descriptionLabel.text = nil;
    }
}

@end
