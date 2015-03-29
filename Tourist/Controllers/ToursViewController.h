//
//  ToursViewController.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToursTableViewCell.h"
#import "ToursDataSource.h"
#import "Session.h"

@interface ToursViewController : UITableViewController

@property (strong, nonatomic, readonly) NSString *reuseIdentifier;
@property (strong, nonatomic, readonly) Session *session;

- (id)initWithSession:(Session *)session;

@end
