//
//  elementViewController.m
//  element
//
//  Created by ervin.aydin on 6/22/14.
//  Copyright (c) 2014 ervinaydin. All rights reserved.
//

#import "elementViewController.h"
#import "elementConnection.h"
#import "elementWeather.h"
#import <CoreLocation/CoreLocation.h>


@interface elementViewController ()

@end

@implementation elementViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _thisElement = [elementConnection new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:@"labelNotification"
                                               object:nil];
    
    if(_weatherDict){
    _baseLabel.text = [_weatherDict objectForKey:@"base"];
    _codLabel.text = [[_weatherDict objectForKey:@"cod"] stringValue];
    _dtLabel.text = [[_weatherDict objectForKey:@"dt"] stringValue];
    _idLabel.text = [[_weatherDict objectForKey:@"id"] stringValue];
    _nameLabel.text = [_weatherDict objectForKey:@"name"];
    _searchTextField.text = [_weatherDict objectForKey:@"name"];
        
    _humidityLabel.text = [[[_weatherDict objectForKey:@"main"] objectForKey:@"humidity"] stringValue];
    _pressureLabel.text = [[[_weatherDict objectForKey:@"main"] objectForKey:@"pressure"] stringValue];
    _tempLabel.text = [[[_weatherDict objectForKey:@"main"] objectForKey:@"temp"] stringValue];
    _tempMaxLabel.text = [[[_weatherDict objectForKey:@"main"] objectForKey:@"temp_max"] stringValue];
    _tempMinLabel.text = [[[_weatherDict objectForKey:@"main"] objectForKey:@"temp_min"] stringValue];
        
    }else{
    
        _baseLabel.text = @"";
        _codLabel.text = @"";
        _dtLabel.text = @"";
        _idLabel.text = @"";
        _nameLabel.text = @"";
        
        _humidityLabel.text = @"";
        _pressureLabel.text = @"";
        _tempLabel.text = @"";
        _tempMaxLabel.text = @"";
        _tempMinLabel.text = @"";
    }
}

- (void) receiveNotification:(NSNotification *) notification
{
    
    if ([[notification name] isEqualToString:@"labelNotification"])
        
    NSLog (@"Successfully received the notification!");
    _weatherDict = [notification userInfo];
    [self viewDidLoad];
}

-(void) callsByCityName:(NSString *)cityName
{
    elementConnection *this = [elementConnection new];
    [this getCallByCityName:cityName];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [self callsByCityName:_searchTextField.text];
    [_searchTextField resignFirstResponder];
    return YES;
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{

    _searchTextField.text = @"";

}

- (IBAction)locButtonPressed:(id)sender {
    
    [_searchTextField resignFirstResponder];
    _searchTextField.text = @"";
     
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];
    
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{

    NSInteger lon = _locationManager.location.coordinate.longitude;
    NSInteger lat = _locationManager.location.coordinate.latitude;
    
    [_thisElement getCallByLocation:lat with:lon];
    [_locationManager stopUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{

    NSLog(@"Check the Problem!");

}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
