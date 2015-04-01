//
//  TourViewController.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/31/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "TourViewController.h"
#import "TourHeaderView.h"
#import "RowsView.h"
#import "TourRowView.h"
#import "PinsRowView.h"
#import "UIColor+Tourist.h"

@interface TourViewController () <APIRequestDelegate>

@property (strong, nonatomic) TouristSessionAPIRequest *request;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) TourHeaderView *headerView;
@property (strong, nonatomic) RowsView *rowsView;
@property (strong, nonatomic) TourRowView *userNameRowView;

@end

@implementation TourViewController

static NSString * const tourViewControllerReuseIdentifier = @"tourViewControllerReuseIdentifier";

- (id)initWithAPIRequest:(TouristSessionAPIRequest *)request {
    if (self = [super init]) {
        self.request = request;
        self.request.delegate = self;
        
        /*
         * Add subviews.
         */
        
        [self.view addSubview:self.scrollView];
        [self.scrollView addSubview:self.contentView];
        [self.contentView addSubview:self.headerView];
        [self.contentView addSubview:self.rowsView];
        
        /*
         * Set up constraints.
         */
        
        [self setupConstraints];
        
        /*
         * Send request
         */
        
        [self.request sendRequest];
        
    }
    
    return self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.scrollView.contentSize = self.contentView.frame.size;
}

- (void)setupConstraints {
    
    /*
     * Scroll view
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.bottomLayoutGuide
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
    
    /*
     * Content view
     */
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:0]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                attribute:NSLayoutAttributeLeft
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeLeft
                                                               multiplier:1
                                                                 constant:0]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1
                                                                 constant:0]];
    
    /*
     * Header view
     */
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1
                                                                  constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1
                                                                  constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1
                                                                  constant:0]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:0.3
                                                                 constant:0]];
    
    /*
     * Rows view
     */
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.rowsView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.headerView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.rowsView
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.headerView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1
                                                                  constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.rowsView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.headerView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1
                                                                  constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.rowsView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:0]];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _contentView;
}

- (TourHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[TourHeaderView alloc] init];
        _headerView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _headerView;
}

- (RowsView *)rowsView {
    if (!_rowsView) {
        _rowsView = [[RowsView alloc] init];
        _rowsView.translatesAutoresizingMaskIntoConstraints = NO;
        _rowsView.separatorSize = 1.0f;
        _rowsView.backgroundColor = [UIColor touristLightGrayColorAlpha:0.25f];
        [_rowsView addRow:self.userNameRowView];
    }
    return _rowsView;
}

- (TourRowView *)userNameRowView {
    if (!_userNameRowView) {
        _userNameRowView = [[TourRowView alloc] init];
        _userNameRowView.translatesAutoresizingMaskIntoConstraints = NO;
        _userNameRowView.backgroundColor = [UIColor whiteColor];
    }
    return _userNameRowView;
}

/*
 * Request delegate
 */

- (void)APIRequest:(APIRequest *)APIRequest successResponse:(NSURLResponse *)response data:(NSData *)data {
    
    /*
     * Parse tour.
     */
    
    NSDictionary *tour = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:nil];
    NSDictionary *user = [tour objectForKey:@"user"];
    NSArray *pins = [tour objectForKey:@"pins"];
    
    /*
     * Set navigation item
     */
    
    self.navigationItem.title = [tour objectForKey:@"name"];
    
    /*
     * Set up header view
     */
    
    self.headerView.nameLabel.text = [tour objectForKey:@"name"];
    self.headerView.descriptionLabel.text = [tour objectForKey:@"description"];
    self.headerView.pinsCount = [NSNumber numberWithInteger:[(NSArray *)[tour objectForKey:@"pins"] count]];
    
    /*
     * Set up rows view.
     */
    
    self.userNameRowView.textLabel.text = [user objectForKey:@"name"];
    
    /*
     * Set pins and refresh table
     */
    
    PinsRowView *pinView;
    NSDictionary *pin;
    for (int i=0; i<pins.count; i++) {
        pin = [pins objectAtIndex:i];
        pinView = [[PinsRowView alloc] init];
        pinView.nameLabel.text = [pin objectForKey:@"name"];
        pinView.addressLabel.text = [[pin objectForKey:@"address"] componentsJoinedByString:@", "];
        pinView.categoryLabel.text = [pin objectForKey:@"category"];
        pinView.descriptionLabel.text = [pin objectForKey:@"description"];
        pinView.numberLabel.text = [NSString stringWithFormat:@"%d", i+1];
        [self.rowsView addRow:pinView];
    }
}

- (void)APIRequest:(APIRequest *)APIRequest failResponse:(NSURLResponse *)response data:(NSData *)data {
    
}

- (void)APIRequest:(APIRequest *)APIRequest error:(NSError *)error {
    
}

@end
