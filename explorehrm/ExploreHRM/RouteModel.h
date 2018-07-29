//
//  RouteModel.h
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-12-01.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"
#import "DirectionsObject.h"
#import "CustomAnnotation.h"

@interface RouteModel : NSObject

- (NSArray*) getAnnotationsForMap;

// Must conform to the DirectionsObject Protocol.
@property (strong, nonatomic) NSArray *directions;
@property (nonatomic) BOOL isComplete;
@property (nonatomic) int currentStep;

@property (strong, nonatomic) NSString *endLocationName;
@property (strong, nonatomic) NSString *startTime;

@property (nonatomic) int rating;

@end
