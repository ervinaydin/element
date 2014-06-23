//
//  elementConnection.m
//  element
//
//  Created by ervin.aydin on 6/22/14.
//  Copyright (c) 2014 ervinaydin. All rights reserved.
//

#import "elementConnection.h"
#import "nativeDataModel.h"

@implementation elementConnection

- (void)getCallByCityName:(NSString*)cityName
{
    // Create the request.
    NSString *urlString = [[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&APPID=fd18a2491ff3ca52b9d6d78a39d1fce0", cityName] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLCacheStorageNotAllowed
                                                       timeoutInterval:20.0];
    
    // Create url connection and fire request
    _conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [_conn start];
    
}

- (void)getCallByLocation:(NSInteger)lat with:(NSInteger)lon
{

    NSString *latStr = [NSString stringWithFormat:@"%ld", lat];
    NSString *lonStr = [NSString stringWithFormat:@"%ld", lon];
    
    // Create the request.
    NSString *urlString = [[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%@&lon=%@&APPID=fd18a2491ff3ca52b9d6d78a39d1fce0", latStr , lonStr] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLCacheStorageNotAllowed
                                                       timeoutInterval:20.0];
    
    // Create url connection and fire request
    _conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [_conn start];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    _contentData = [NSMutableData new];
    [_contentData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"did receive response! %@, %@", connection, response);
    _response = response;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Bad: %@", [error description]);
    
    connection = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    [self deserializeJsonContent:_contentData];
}

- (id)deserializeJsonContent:(NSData*) content
{
	NSError* error = nil;
    nativeDataModel *ndm;
    
	id jsonObject = [NSJSONSerialization JSONObjectWithData:content options:NSJSONReadingAllowFragments error:&error];

	if (jsonObject != nil && error == nil) {
		
        NSLog(@"Succesfully deserialized...");
		
        if ([jsonObject isKindOfClass:[NSDictionary class]]) {
			
            _deserializedDictionary = jsonObject;
			NSLog(@"Deserialized JSON dictionary = %@", _deserializedDictionary);
            
            if([_deserializedDictionary objectForKey:@"message"]){
            
                NSLog(@"Error, check the city name!");
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Please check the city name!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                
            }else{
            ndm = [nativeDataModel new];
            [ndm readDictionary:_deserializedDictionary];
            }
        } else if ([jsonObject isKindOfClass:[NSArray class]]) {
			
            _deserializedArray = (NSArray*) jsonObject;
			ndm = [nativeDataModel new];
            [ndm readArray:_deserializedArray];

		}
    
    } else if (error != nil) {
		NSLog(@"An error happened while deserializing the JSON data.");
	}
	
	return jsonObject;
}

@end

