//
//  ShareViewController.m
//  ExploreHRM
//
//  Created by Sarah Morash on 2013-11-17.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import "ShareViewController.h"
#import <Twitter/Twitter.h>

@interface ShareViewController ()

@end

@implementation ShareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Post information to Twitter iOS SDK 5.1
- (IBAction)postToTwitter:(id)sender {
    Boolean cancelled = false;
    
    if ([TWTweetComposeViewController canSendTweet]) {
        TWTweetComposeViewController *vc = [[TWTweetComposeViewController alloc] init];
        [vc setInitialText:@"This tweet was sent using the new Twitter framework available in iOS 5."];
        UIImage *image = [UIImage imageNamed:@"note.png"];
        [vc addImage:image];
        [vc setCompletionHandler:^(SLComposeViewControllerResult result) {
            if (result == SLComposeViewControllerResultCancelled)
                _cancelled = true;
            [self dismissModalViewControllerAnimated:YES];
        }];
        
        // On completion
        [self presentViewController:vc animated:YES completion:nil];
        if (cancelled == false) {
            [_shareSuccess setHidden:false];
            [NSTimer scheduledTimerWithTimeInterval:5.0
                                    target:self
                                    selector:@selector(removeMessage)
                                    userInfo:nil
                                    repeats:NO];
        }
    } else {
        // Show Alert View When The Application Cannot Send Tweets
        NSString *message = @"The application cannot send a tweet at the moment. This is because it cannot reach Twitter or you don't have a Twitter account associated with this device.";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:message delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];    [alertView show];
        [_shareError setHidden:false];
        [NSTimer scheduledTimerWithTimeInterval:5.0
                                    target:self
                                    selector:@selector(removeMessage)
                                    userInfo:nil
                                    repeats:NO];
    }
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

// Sends information to Statistics View Controller
- (IBAction)stats:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *statsVC = [storyboard instantiateViewControllerWithIdentifier:@"StatsVC"];
    [self.navigationController pushViewController:statsVC animated:YES];
}

- (void)viewDidUnload {
    [self setShareError:nil];
    [self setShareSuccess:nil];
    [self setImageToShare:nil];
    [self setTextToShare:nil];
    [super viewDidUnload];
}

- (void)removeMessage {
    [_shareError setHidden:true];
    [_shareSuccess setHidden:true];
}

/* Post information to Twitter - iOS SDK 6.1
 - (IBAction)postToTwitter:(id)sender {
 if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
 {
 SLComposeViewController *tweet = [SLComposeViewController
 composeViewControllerForServiceType:SLServiceTypeTwitter];
 [tweet setInitialText:@"TWEET"];
 [tweet addImage:[UIImage imageNamed:@"note.png"]];
 [self presentViewController:tweet animated:YES completion:nil];
 }
 }*/


@end
