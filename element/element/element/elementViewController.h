//
//  elementViewController.h
//  element
//
//  Created by ervin.aydin on 6/22/14.
//  Copyright (c) 2014 ervinaydin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "elementConnection.h"

@interface elementViewController : UIViewController<UITextFieldDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (weak, nonatomic) IBOutlet UILabel *baseLabel;
@property (weak, nonatomic) IBOutlet UILabel *codLabel;
@property (weak, nonatomic) IBOutlet UILabel *dtLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
                       
@property (weak, nonatomic) NSDictionary *weatherDict;

@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempMaxLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempMinLabel;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) elementConnection *thisElement;

- (IBAction)locButtonPressed:(id)sender;

@end
