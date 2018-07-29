//
//  ShareViewController.h
//  ExploreHRM
//
//  Created by Sarah Morash on 2013-11-17.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *showAchievements;
@property (weak, nonatomic) IBOutlet UIButton *showMap;
@property (weak, nonatomic) IBOutlet UIButton *showRoute;
@property (weak, nonatomic) IBOutlet UIButton *showStats;
@property (weak, nonatomic) IBOutlet UILabel *shareError;
@property (weak, nonatomic) IBOutlet UILabel *shareSuccess;
@property (assign, readonly, nonatomic) Boolean cancelled;
@property (weak, nonatomic) IBOutlet UIImageView *imageToShare;
@property (weak, nonatomic) IBOutlet UITextField *textToShare;

- (IBAction)map:(id)sender;
- (IBAction)route:(id)sender;
- (IBAction)stats:(id)sender;
- (IBAction)achievements:(id)sender;

- (IBAction)postToTwitter:(id)sender;
- (void)removeMessage;

@end
