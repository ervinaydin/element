//
//  elementWeather.h
//  element
//
//  Created by ervin.aydin on 6/23/14.
//  Copyright (c) 2014 ervinaydin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface elementWeather : NSObject

@property (nonatomic, strong) NSString *base;
@property (nonatomic, strong) NSDictionary *cloudsDict;
@property (nonatomic, strong) NSString *cod;
@property (nonatomic, strong) NSDictionary *coordDict;
@property (nonatomic, strong) NSString *dt;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSDictionary *mainDict;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDictionary *sysDict;
@property (nonatomic, strong) NSDictionary *weatherDict;
@property (nonatomic, strong) NSDictionary *windDict;

@end
