//
//  StatisticsViewController.h
//  ExploreHRM
//
//  Created by Sarah Morash on 2013-11-17.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatisticsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *showAchievements;
@property (weak, nonatomic) IBOutlet UIButton *showMap;
@property (weak, nonatomic) IBOutlet UIButton *showRoute;
@property (weak, nonatomic) IBOutlet UIButton *showShare;


- (IBAction)map:(id)sender;
- (IBAction)route:(id)sender;
- (IBAction)share:(id)sender;
- (IBAction)achievements:(id)sender;

@end
