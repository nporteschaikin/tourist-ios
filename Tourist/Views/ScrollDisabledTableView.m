//
//  ScrollDisabledTableView.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/31/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "ScrollDisabledTableView.h"

@implementation ScrollDisabledTableView

- (CGSize)intrinsicContentSize {
    
    /*
     * Force contentSize to be
     * updated immediately
     */
    
    [self layoutIfNeeded];
    
    /*
     * Set content size.
     */
    
    return CGSizeMake(UIViewNoIntrinsicMetric, self.contentSize.height);
}

@end
