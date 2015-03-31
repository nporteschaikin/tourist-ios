//
//  ToursNearbyViewController.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "ToursViewController.h"
#import "ToursAPIDataSource.h"

@interface ToursNearbyViewController : ToursViewController

@property (strong, nonatomic) ToursAPIDataSource *dataSource;

@end
