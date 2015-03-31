//
//  RowsView.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/31/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "RowsView.h"

@interface RowsView ()

@property (strong, nonatomic) NSArray *rows;

@end

@implementation RowsView

- (void)insertRow:(UIView *)row
          atIndex:(NSUInteger)index {
    
    /*
     * Copy rows into mutable array.
     */
    
    NSMutableArray *rows = [NSMutableArray arrayWithArray:self.rows];
    
    /*
     * Add row to array at index
     */
    
    [rows insertObject:row
               atIndex:index];
    
    /*
     * Don't translate auto-resizing masks to constraints
     */
    
    row.translatesAutoresizingMaskIntoConstraints = NO;
    
    /*
     * Set rows.
     */
    
    self.rows = rows;
    
    /*
     * Add row as subview.
     */
    
    [self insertSubview:row
                atIndex:index];
    
    /*
     * Set layout.
     */
    
    [self setLayout];
    
}

- (void)addRow:(UIView *)row {
    
    /*
     * Insert row at last index.
     */
    
    [self insertRow:row
            atIndex:self.rows.count];
}

- (void)setLayout {
    UIView *row;
    UIView *prevRow;
    
    /*
     * Remove all constraints.
     */
    
    [self removeConstraints:self.constraints];
    
    for (int i=0; i<self.rows.count; i++) {
        
        row = [self.rows objectAtIndex:i];
        
        /*
         * Add left and right constraints.
         */
        
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:row
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:0],
                               [NSLayoutConstraint constraintWithItem:row
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1
                                                             constant:0]
                               ]];
        
        if (self.rows.count == i - 2) {
            
            prevRow = [self.rows objectAtIndex:i-1];
            
            /*
             * If previous row exists, constraint top 
             * of current row to bottom of previous
             * row.
             */
            
            [self addConstraints:@[
                                   [NSLayoutConstraint constraintWithItem:row
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:prevRow
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:self.separatorSize]
                                   ]];
            
        } else {
            
            /*
             * Otherwise, constrain to bottom of row.
             */
            
            [self addConstraints:@[
                                   [NSLayoutConstraint constraintWithItem:row
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:0]
                                   ]];
            
        };
    }
}

- (void)layoutIfNeeded {
    
    /*
     * Set layout.
     */
    
    [self setLayout];
}

@end
