//
//  RouteSelectionViewController.h
//  ExploreHRM
//
//  Created by Sarah Morash on 2013-12-01.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RouteManager.h"
#import "RouteModel.h"
#import "RouteTableCell.h"

@interface RouteSelectionViewController : UITableViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end
