//
//  ViewController.h
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-11-15.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MessagingQueue.h"
#import "DirectionsObject.h"
#import "RouteModel.h"
#import "RouteManager.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *moreOptions;
@property (weak, nonatomic) IBOutlet UIButton *showRoute;
@property (weak, nonatomic) IBOutlet UIButton *showAchievements;
@property (weak, nonatomic) IBOutlet UIButton *showShare;
@property (weak, nonatomic) IBOutlet UIButton *showStats;
@property (weak, nonatomic) IBOutlet UITextField *destination;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, assign) BOOL optionsAreShown; // True if they are, false otherwise
@property (nonatomic, assign) BOOL newRoute;

@property (copy, nonatomic) NSString* destText;


- (IBAction)arrow:(id)sender;
- (IBAction)route:(id)sender;
- (IBAction)achievements:(id)sender;
- (IBAction)share:(id)sender;
- (IBAction)stats:(id)sender;
- (IBAction)createRoute:(id)sender;

@end
