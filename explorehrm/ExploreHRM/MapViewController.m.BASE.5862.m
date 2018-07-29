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
    
    self.mapView.scrollEnabled = false;
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

@end
