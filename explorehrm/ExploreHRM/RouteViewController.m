//
//  RouteViewController.m
//  ExploreHRM
//
//  Created by Sarah Morash on 2013-11-17.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import "RouteViewController.h"

@interface RouteViewController ()

@end

@implementation RouteViewController

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
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }

    // Load the Rating from the current Model
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

// Sends information to Achievements View Controller
- (IBAction)achievements:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *achievementsVC = [storyboard instantiateViewControllerWithIdentifier:@"AchievementsVC"];
    [self.navigationController pushViewController:achievementsVC animated:YES];
}

/** 
 * Used to rate the route you are currently on
 * Pressing the first star = 1/5
 * Second star = 2/5 (and the previous star will light up as well)
 * etc..
 */
- (IBAction)rateRoute:(id)sender {
    
    // 1/5
    if((UIButton *)sender == _star1) {
        [_star1 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star2 setImage:[UIImage imageNamed:@"blankStar.png"] forState:UIControlStateNormal];
        [_star3 setImage:[UIImage imageNamed:@"blankStar.png"] forState:UIControlStateNormal];
        [_star4 setImage:[UIImage imageNamed:@"blankStar.png"] forState:UIControlStateNormal];
        [_star5 setImage:[UIImage imageNamed:@"blankStar.png"] forState:UIControlStateNormal];

    // 2/5
    } else if((UIButton *)sender == _star2){
        [_star1 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star2 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star3 setImage:[UIImage imageNamed:@"blankStar.png"] forState:UIControlStateNormal];
        [_star4 setImage:[UIImage imageNamed:@"blankStar.png"] forState:UIControlStateNormal];
        [_star5 setImage:[UIImage imageNamed:@"blankStar.png"] forState:UIControlStateNormal];

    // 3/5
    } else if((UIButton *)sender == _star3){
        [_star1 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star2 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star3 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star4 setImage:[UIImage imageNamed:@"blankStar.png"] forState:UIControlStateNormal];
        [_star5 setImage:[UIImage imageNamed:@"blankStar.png"] forState:UIControlStateNormal];
    
    // 4/5
    } else if((UIButton *)sender == _star4){
        [_star1 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star2 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star3 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star4 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star5 setImage:[UIImage imageNamed:@"blankStar.png"] forState:UIControlStateNormal];

    // 5/5
    } else {
        [_star1 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star2 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star3 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star4 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [_star5 setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
}
/*
- (IBAction)showLibrary:(id)sender {
    UIImagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

}*/

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

#define kOFFSET_FOR_KEYBOARD 100.0

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:_noteText])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD + 40.0;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

/*
- (BOOL)textField:(UITextField *)noteText shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.length > 0)
    {
        NSUInteger length = [string length];
        NSLog(@"%i",length);
        // We're deleting
    }
    else
    {
        NSUInteger length = [string length];
        NSLog(@"%i",length);
        // We're adding
    }
    return true;
}*/

// Remove keyboard from screen; remove photo library and camera options from screen
- (IBAction)scrollTap:(id)sender {
    [_noteText resignFirstResponder];
    [_camera setHidden:true];
    [_photoLibrary setHidden:true];
}

// Take user to camera to take new photo
- (IBAction)takePicture:(id)sender {
        
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    //picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

// Take user to photo library to select photo
- (IBAction)chooseFromLibrary:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    //picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

// Show buttons to select a photo from photo library or take a new photo with camera
- (IBAction)showPhotoOptions:(id)sender{
    [_camera setHidden:false];
    [_photoLibrary setHidden:false];
}

// Dismiss image picker view 
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

// Show chosen image in image view on screen
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.routeImage.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


@end
