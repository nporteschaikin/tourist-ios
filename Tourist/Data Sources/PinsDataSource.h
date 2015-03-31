//
//  PinsDataSource.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/30/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PinsDataSourceDelegate

- (void)configureCell:(UITableViewCell *)cell
               forPin:(NSDictionary *)pin;

@end

@interface PinsDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray *pins;

@property (strong, nonatomic) id<PinsDataSourceDelegate> delegate;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
