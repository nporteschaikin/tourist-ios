//
//  ToursViewController.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "ToursViewController.h"
#import "TourViewController.h"
#import "TouristSessionAPIRequest.h"
#import "Constants.h"

@interface ToursViewController ()

@property (strong, nonatomic) Session *session;

@end

@implementation ToursViewController

- (id)initWithSession:(Session *)session {
    if (self = [super init]) {
        self.session = session;
        self.dataSource = [[ToursDataSource alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * Set up table view.
     */
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    /*
     * Register class w/ reuse identifier.
     */
    
    [self.dataSource registerReuseIdentifiersForTableView:self.tableView];
    
    /*
     * Style table view.
     */
    
    self.tableView.separatorColor = [UIColor clearColor];
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
    
    /*
     * Get tour ID
     */
    
    NSDictionary *tour = [self.dataSource.tours objectAtIndex:indexPath.row];
    NSString *tourID = [tour objectForKey:IOTourIDAttribute];
    
    /*
     * Create request
     */
    
    TouristSessionAPIRequest *request = [[TouristSessionAPIRequest alloc] initWithSession:self.session];
    request.endpoint = [NSString stringWithFormat:IOTourEndpoint, tourID];
    
    /*
     * Push to tour view controller.
     */
    
    TourViewController *tourViewController = [[TourViewController alloc] initWithAPIRequest:request];
    [self.navigationController pushViewController:tourViewController
                                         animated:YES];
    
}

@end
