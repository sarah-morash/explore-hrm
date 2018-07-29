//
//  RouteTableCell.h
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-12-01.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RouteTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *routeName;
@property (weak, nonatomic) IBOutlet UILabel *routeTime;

@end
