//
//  RouteManager.m
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-12-01.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import "RouteManager.h"

@implementation RouteManager

+(RouteManager *)getSharedInstance {
    static RouteManager* sharedInstance;
    if(!sharedInstance) {
        sharedInstance = [[RouteManager alloc] init];
    }
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.listOfRoutes = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
