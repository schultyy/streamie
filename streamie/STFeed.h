//
// Created by Jan Schulte on 09/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface STFeed : NSObject

@property (readonly, strong) NSString *address;
@property (readonly, strong) NSArray *episodes;

-(id) initWithManagedObject: (NSManagedObject *) managedObject;

@end
