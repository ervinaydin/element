//
//  elementConnection.h
//  element
//
//  Created by ervin.aydin on 6/22/14.
//  Copyright (c) 2014 ervinaydin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface elementConnection : NSObject<NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (strong, nonatomic) NSMutableData *contentData;
@property (strong, nonatomic) NSURLConnection *conn;
@property (strong, nonatomic) NSURLResponse *response;
@property (strong, nonatomic) NSDictionary *deserializedDictionary;
@property (strong, nonatomic) NSArray *deserializedArray;

-(void)getCallByCityName:(NSString*)cityName;
- (void)getCallByLocation:(NSInteger)lat with:(NSInteger)lon;

@end