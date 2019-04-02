//
//  ViewController.m
//  Camera
//
//  Created by Kyle Klopfenstein on 3/23/18.
//  Copyright © 2018 Kyle Klopfenstein. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController{
    CLLocationManager * locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}


@synthesize status,trackingStatus, latitudeLabel, longitudeLabel, addressLabel, speedLabel, unitController;



- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc]init]; // Initializing locationManager
    geocoder = [[CLGeocoder alloc] init];  // Initializing geocoder
    status.hidesWhenStopped = true;
    trackingStatus.hidesWhenStopped = true;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)getCurrentLocation:(id)sender {
    NSLog(@"Get My Location Button Was Pressed"); // For Logging
    [status  startAnimating];  // Starts status animation
    [trackingStatus startAnimating];
    [self->locationManager requestWhenInUseAuthorization];  // Method to ask user for location permission
    locationManager.delegate = nil;
    latitudeLabel.text = nil;  // Clears labels
    longitudeLabel.text = nil;
    speedLabel.text = nil;
    addressLabel.text = nil;
    
    locationManager.delegate = self; // Sets the delegate of locationManager to self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest; // Setting the accuracy
    
    [locationManager startUpdatingLocation];  //Requesting location updates
}


- (IBAction)stopButton:(id)sender {
    [locationManager stopUpdatingLocation];
    [trackingStatus stopAnimating];
    speedLabel.text = nil;
    
}




// Clears values and stops locationManager
- (IBAction)clearButton:(id)sender {
    NSLog(@"Clear Button Was Pressed");  // For Logging
    [status  stopAnimating];  // Stops animation
    [trackingStatus stopAnimating];
    latitudeLabel.text = nil;  // Clears labels
    longitudeLabel.text = nil;
    addressLabel.text = nil;
    speedLabel.text = nil;
    [unitController setSelectedSegmentIndex:0];
    [locationManager stopUpdatingLocation];  // Stops updating location
}







- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);  // Logging
    CLLocation *currentLocation = newLocation;  // Created new instance of CLLocation
    
    longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];  // Outputs longitude
    latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];  // Ouputs Latitude
    
    
    switch (self.unitController.selectedSegmentIndex) {
        case 0:
            if (currentLocation.speed > -1){
                speedLabel.text = [NSString stringWithFormat:@"%.f %@", [currentLocation speed] * 2.236936284, @"MPH"]; //Shows speed in MPH
            }
            break;
        case 1:
            if (currentLocation.speed > -1){
                speedLabel.text = [NSString stringWithFormat:@"%.f %@", [currentLocation speed] * 3.6, @"km/h"];  //Shows speed in km/h
            }
            break;
        default:
            break;
    }
    
    // Reverse Geocoding for address
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation: currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            self->placemark = [placemarks lastObject];
            self->addressLabel.text = [NSString stringWithFormat:@" %@ %@ \n %@ %@ %@ \n %@",
                                       self->placemark.subThoroughfare, self->placemark.thoroughfare,
                                       self->placemark.locality, self->placemark.administrativeArea,
                                       self->placemark.postalCode, self->placemark.country];;
            
            [self->status  stopAnimating];  // Stops updating location
            
            
            
        } else {
            NSLog(@"%@", error.debugDescription);}}];
    
}




-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
    [status  stopAnimating];  // Stops updating location
    
    NSLog(@"didFailWithError: %@", error);  // Logging
    
    // Creates error alert popup with ok button
    UIAlertController * errorAlert = [UIAlertController  alertControllerWithTitle: @"Error"
                                                                          message:@"Failed to Get Your Location"
                                                                   preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * OKButton = [UIAlertAction actionWithTitle:@"OK"
                                                        style: UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action){[manager stopUpdatingLocation];
                                                      }];
    
    
    [errorAlert addAction: OKButton];
    
    [self presentViewController:errorAlert animated:YES completion:nil];
}






- (IBAction)jokeButton:(id)sender {
    NSLog(@"You pressed the button, now you have to hire me!");  // For Logging
}


- (IBAction)backButton:(id)sender {
}


- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue{
}


@end
