//
//  TourViewController.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/31/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "TourViewController.h"
#import "TourHeaderView.h"

@interface TourViewController () <APIRequestDelegate>

@property (strong, nonatomic) TouristSessionAPIRequest *request;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) TourHeaderView *headerView;

@end

@implementation TourViewController

- (id)initWithAPIRequest:(TouristSessionAPIRequest *)request {
    if (self = [super init]) {
        self.request = request;
        self.request.delegate = self;
        
        /*
         * Make local view UIScrollView.
         */
        
        self.view = [[UIScrollView alloc] init];
        [self.view addSubview:self.contentView];
        
        /*
         * Add subviews.
         */
        
        [self.contentView addSubview:self.headerView];
        
        
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

- (void)setupConstraints {
    
    /*
     * Scroll view
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
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
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:0.3
                                                                  constant:0]];
    
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
        _contentView.backgroundColor = [UIColor whiteColor];
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
    
    /*
     * Set up header view
     */
    
    self.headerView.nameLabel.text = [tour objectForKey:@"name"];
    self.headerView.descriptionLabel.text = [tour objectForKey:@"description"];
    self.headerView.pinsCount = [NSNumber numberWithInteger:[(NSArray *)[tour objectForKey:@"pins"] count]];
    
}

- (void)APIRequest:(APIRequest *)APIRequest failResponse:(NSURLResponse *)response data:(NSData *)data {
    
}

- (void)APIRequest:(APIRequest *)APIRequest error:(NSError *)error {
    
}

@end
