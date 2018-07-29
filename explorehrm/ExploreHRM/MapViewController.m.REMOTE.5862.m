//
//  ViewController.m
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-11-15.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

int lastRequestedMessage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _optionsAreShown = false;
	// Do any additional setup after loading the view, typically from a nib.
    
    CLLocationCoordinate2D center;
    center.latitude = 44.663159;
    center.longitude = -63.617224;
    [self.mapView setCenterCoordinate:center];
    
    // Set the Span for the Lat and Long
    MKCoordinateSpan span;
	span.latitudeDelta = .06;
	span.longitudeDelta = .03;
    
    MKCoordinateRegion region;
	region.center = center;
	region.span = span;
	self.mapView.region = [self.mapView regionThatFits:region];
    
    // Start following the user's location
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    self.mapView.scrollEnabled = true;

    
    CLLocationCoordinate2D pinCoord;
    pinCoord.latitude = 44.663159;
    pinCoord.longitude = -63.618224;
    
    MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc] init];
    pointAnnotation.coordinate = pinCoord;
    
    [self.mapView addAnnotation:pointAnnotation];
    
    [[MessagingQueue getSharedInstance] addObserver:self forKeyPath:@"messageQueue" options:NSKeyValueObservingOptionNew context:@"Hello"];
    lastRequestedMessage = [[MessagingQueue getSharedInstance] getDirectionsFromCurrentPosition];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateDirections) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Shows/hides all options (for a larger map)
- (IBAction)arrow:(id)sender {
    
    if (_optionsAreShown == false) {
        [_showRoute setHidden:FALSE];
        [_showAchievements setHidden:FALSE];
        [_showShare setHidden:FALSE];
        [_showStats setHidden:FALSE];
        _optionsAreShown = true;
    } else {
        [_showRoute setHidden:TRUE];
        [_showAchievements setHidden:TRUE];
        [_showShare setHidden:TRUE];
        [_showStats setHidden:TRUE];
        _optionsAreShown = false;
    }
}

// Sends information to Route View Controller
- (IBAction)route:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *routeVC = [storyboard instantiateViewControllerWithIdentifier:@"RouteVC"];
    [self.navigationController pushViewController:routeVC animated:YES];
}

// Sends information to Achievements View Controller
- (IBAction)achievements:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *achievementsVC = [storyboard instantiateViewControllerWithIdentifier:@"AchievementsVC"];
    [self.navigationController pushViewController:achievementsVC animated:YES];
}

// Sends information to Share View Controller
- (IBAction)share:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *shareVC = [storyboard instantiateViewControllerWithIdentifier:@"ShareVC"];
    [self.navigationController pushViewController:shareVC animated:YES];
}

// Sends information to Statistics View Controller
- (IBAction)stats:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *statsVC = [storyboard instantiateViewControllerWithIdentifier:@"StatsVC"];
    [self.navigationController pushViewController:statsVC animated:YES];
}

#pragma mark MKMapViewDelegate Events

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    CLLocationCoordinate2D center;
    center.latitude = userLocation.location.coordinate.latitude;
    center.longitude = userLocation.location.coordinate.longitude;
    [self.mapView setCenterCoordinate:center];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    NSLog(@"%f, %f", annotation.coordinate.latitude, annotation.coordinate.longitude);
    
    if(mapView.userLocation == annotation) {
        return nil;
    }
    
    MKPinAnnotationView* pinView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"TestMap"];
    
    if(!pinView) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"TestMap"];
        
        if(annotation.coordinate.latitude==((DirectionsObject*)[[RouteManager getSharedInstance].currentRoute.directions objectAtIndex:0]).endLocation.latitude &&
           annotation.coordinate.longitude==((DirectionsObject*)[[RouteManager getSharedInstance].currentRoute.directions objectAtIndex:0]).endLocation.longitude) {
            pinView.pinColor = MKPinAnnotationColorRed;
        } else {
            pinView.pinColor = MKPinAnnotationColorGreen;
        }
        
        
        pinView.annotation.coordinate = annotation.coordinate;
    }
    return pinView;
}

- (void) updateDirections {
    
    if([[[MessagingQueue getSharedInstance] messageQueue] objectForKey:[NSNumber numberWithInt:lastRequestedMessage]] != nil) {
        NSDictionary *directionsJSON = [[[MessagingQueue getSharedInstance] messageQueue] objectForKey:[NSNumber numberWithInt:lastRequestedMessage]];
        [[[MessagingQueue getSharedInstance] messageQueue] removeObjectForKey:[NSNumber numberWithInt:lastRequestedMessage]];
        
        NSArray *routes = [directionsJSON objectForKey:@"routes"];
        NSLog(@"%@", routes);
        

        NSArray *legs = [[routes objectAtIndex:0] objectForKey:@"legs"];
        NSArray *steps = [[legs objectAtIndex:0] objectForKey:@"steps"];
        
        NSMutableArray *directionsArray = [[NSMutableArray alloc] init];
        for (NSDictionary *step in steps) {
            MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc] init];
            
            DirectionsObject *dir = [[DirectionsObject alloc] init];
            
            // Start Location
            float lat = [[[step objectForKey:@"start_location"] objectForKey:@"lat"] floatValue];
            float lng = [[[step objectForKey:@"start_location"] objectForKey:@"lng"] floatValue];
            
            CLLocationCoordinate2D startLocation;
            startLocation.latitude = lat;
            startLocation.longitude = lng;
            
            dir.startLocation = startLocation;
            
            // End Location
            lat = [[[step objectForKey:@"end_location"] objectForKey:@"lat"] floatValue];
            lng = [[[step objectForKey:@"end_location"] objectForKey:@"lng"] floatValue];
            
            CLLocationCoordinate2D endLocation;
            endLocation.latitude = lat;
            endLocation.longitude = lng;
            
            dir.endLocation = endLocation;
            
            [directionsArray addObject:dir];
        }
        
        RouteModel *currentRoute = [[RouteModel alloc] init];  
        currentRoute.directions = directionsArray;
        
        [RouteManager getSharedInstance].currentRoute = currentRoute;
        [[RouteManager getSharedInstance].listOfRoutes addObject:currentRoute];
        
        [self.mapView removeAnnotations:self.mapView.annotations];
        [self.mapView addAnnotations:[[RouteManager getSharedInstance].currentRoute getAnnotationsForMap]];
    }
}



@end
