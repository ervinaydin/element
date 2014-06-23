//
//  nativeDataModel.m
//  element
//
//  Created by ervin.aydin on 6/23/14.
//  Copyright (c) 2014 ervinaydin. All rights reserved.
//

#import "nativeDataModel.h"
#import "elementWeather.h"
#import "elementViewController.h"

@implementation nativeDataModel

-(void)readArray:array{

    NSLog(@"Array");
}

-(void)readDictionary:dict{
    
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"labelNotification"
         object:self userInfo:dict];
        
}


@end
