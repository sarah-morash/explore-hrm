//
//  RouteModel.m
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-12-01.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import "RouteModel.h"

@implementation RouteModel

- (id)init
{
    self = [super init];
    if (self) {
        self.directions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray*)getAnnotationsForMap {    
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    for(int i=self.currentStep; i<[self.directions count];i++) {
        DirectionsObject* dir = [self.directions objectAtIndex:i];
        CustomAnnotation *annotation = [[CustomAnnotation alloc] init];
        annotation.coordinate = dir.endLocation;
        annotation.stepNumber = i;
        
        [annotations addObject:annotation];
    }
    
    return annotations;
}

@end
