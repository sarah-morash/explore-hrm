//
//  DirectionsManager.m
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-11-28.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import "DirectionsManager.h"

@implementation DirectionsManager

static DirectionsManager* directionManager;
int requestID;
NSArray* directionsObjectQueue;

+ (DirectionsManager *) getSharedInstance {
    
    if(directionManager == nil) {
        directionManager = [[DirectionsManager alloc] init];
    }
    return directionManager;
}

- (int) requestDirectionsToAddress:(NSString *)address{
    
    int requestTicketID = requestID++;
    // Request the Google Maps API to get Directions
    return requestTicketID;
}

- (NSArray *) getQueuedDirectionsWithID:(int)requestID {
    return nil;
}

@end
