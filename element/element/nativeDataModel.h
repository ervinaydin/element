//
//  nativeDataModel.h
//  element
//
//  Created by ervin.aydin on 6/23/14.
//  Copyright (c) 2014 ervinaydin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface nativeDataModel : NSObject

-(void)readDictionary:(NSDictionary *)dict;
-(void)readArray:(NSArray *)array;

@end
