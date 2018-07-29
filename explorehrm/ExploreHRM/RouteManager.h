//
//  RouteManager.h
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-12-01.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RouteModel.h"

@interface RouteManager : NSObject

@property (strong, nonatomic) RouteModel *currentRoute;
@property (strong, nonatomic) NSMutableArray *listOfRoutes;

+ (RouteManager*) getSharedInstance;

@end
