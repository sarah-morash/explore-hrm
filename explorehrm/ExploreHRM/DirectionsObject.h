//
//  DirectionsObject.h
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-11-28.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

@interface DirectionsObject : NSObject

// Start Location
@property (nonatomic, assign) CLLocationCoordinate2D startLocation;

// End Location
@property (nonatomic, assign) CLLocationCoordinate2D endLocation;

// Distance
@property (nonatomic, assign) int distance;

// Duration
@property (nonatomic, assign) int duration;

@end
