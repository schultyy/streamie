//
// Created by Jan Schulte on 09/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface STFeed : NSObject

@property (readonly, strong) NSString *address;

-(id) initWithAddress: (NSString *) address;

@end
