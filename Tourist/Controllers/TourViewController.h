//
//  TourViewController.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/31/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouristSessionAPIRequest.h"

@interface TourViewController : UIViewController

- (id)initWithAPIRequest:(TouristSessionAPIRequest *)request;

@end
