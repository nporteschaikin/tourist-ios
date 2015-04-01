//
//  TourRowsView.h
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/31/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RowsView : UIView

@property (strong, nonatomic, readonly) NSArray *rows;
@property (nonatomic) CGFloat separatorSize;

- (void)insertRow:(UIView *)row
          atIndex:(NSUInteger)index;

- (void)addRow:(UIView *)row;

@end
