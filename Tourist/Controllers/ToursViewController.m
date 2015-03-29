//
//  ToursViewController.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "ToursViewController.h"

@interface ToursViewController ()

@property (strong, nonatomic) NSString *reuseIdentifier;
@property (strong, nonatomic) Session *session;

@end

@implementation ToursViewController

NSString * const toursViewControllerReuseIdentifier = @"toursViewControllerReuseIdentifier";

- (id)init {
    if (self = [super init]) {
        self.reuseIdentifier = toursViewControllerReuseIdentifier;
        
        /*
         * Register class w/ reuse identifier.
         */
        
        [self.tableView registerClass:[ToursTableViewCell class]
               forCellReuseIdentifier:self.reuseIdentifier];
        
        /*
         * Style table view.
         */
        
        self.tableView.separatorColor = [UIColor clearColor];
        
    }
    return self;
}

- (id)initWithSession:(Session *)session {
    if (self = [self init]) {
        self.session = session;
    }
    return self;
}

/*
 * UITableViewDelegate
 */

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:NO];
}

@end
