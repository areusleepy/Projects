//
//  ViewController.h
//  Camera
//
//  Created by Kyle Klopfenstein on 3/23/18.
//  Copyright © 2018 Kyle Klopfenstein. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController < UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;


@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;


@property (weak, nonatomic) IBOutlet UILabel *speedLabel;


@property (weak, nonatomic) IBOutlet UISegmentedControl *unitController;


@property (weak, nonatomic) IBOutlet UILabel *addressLabel;



@property IBOutlet UIActivityIndicatorView *status;


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *trackingStatus;


- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue;


- (IBAction)getCurrentLocation:(id)sender;


- (IBAction)stopButton:(id)sender;


- (IBAction)clearButton:(id)sender;


- (IBAction)jokeButton:(id)sender;


- (IBAction)backButton:(id)sender;


@end
