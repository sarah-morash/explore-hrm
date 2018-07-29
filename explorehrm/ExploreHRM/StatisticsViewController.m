//
//  StatisticsViewController.m
//  ExploreHRM
//
//  Created by Sarah Morash on 2013-11-17.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import "StatisticsViewController.h"

@interface StatisticsViewController ()

@end

@implementation StatisticsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Sends information to Map View Controller
- (IBAction)map:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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

@end
