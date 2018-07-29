//
//  CustomAnnotation.h
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-12-01.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface CustomAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *subtitle;
@property (nonatomic, readonly, copy) NSString *title;

@property (nonatomic) int stepNumber;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
