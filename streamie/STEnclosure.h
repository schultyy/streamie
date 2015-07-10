//
// Created by Jan Schulte on 10/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface STEnclosure : NSObject

@property (readonly, strong) NSString *url;
@property (readonly, strong) NSString *type;
@property (readonly, strong) NSNumber *length;

-(id) initWithManagedObject: (NSManagedObject *) object;

@end
