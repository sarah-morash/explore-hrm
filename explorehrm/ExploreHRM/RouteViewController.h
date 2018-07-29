//
//  RouteViewController.h
//  ExploreHRM
//
//  Created by Sarah Morash on 2013-11-17.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RouteModel.h"

@interface RouteViewController : UIViewController  <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) RouteModel *currentModel;

@property (weak, nonatomic) IBOutlet UIButton *showAchievements;
@property (weak, nonatomic) IBOutlet UIButton *showMap;
@property (weak, nonatomic) IBOutlet UIButton *showShare;
@property (weak, nonatomic) IBOutlet UIButton *showStats;
@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;
@property (weak, nonatomic) IBOutlet UITextView *noteText;
@property (weak, nonatomic) IBOutlet UIScrollView *routeScrollView;
@property (weak, nonatomic) IBOutlet UIButton *camera;
@property (weak, nonatomic) IBOutlet UIButton *photoLibrary;
@property (weak, nonatomic) IBOutlet UIImageView *routeImage;


- (IBAction)map:(id)sender;
- (IBAction)share:(id)sender;
- (IBAction)stats:(id)sender;
- (IBAction)achievements:(id)sender;
- (IBAction)rateRoute:(id)sender;
- (IBAction)showPhotoOptions:(id)sender;
- (IBAction)scrollTap:(id)sender;
- (IBAction)takePicture:(id)sender;
- (IBAction)chooseFromLibrary:(id)sender;


@end
