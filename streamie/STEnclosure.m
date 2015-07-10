//
// Created by Jan Schulte on 10/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STEnclosure.h"

@interface STEnclosure()
@property (readwrite, strong) NSString *url;
@property (readwrite, strong) NSString *type;
@property (readwrite, strong) NSNumber *length;
@end

@implementation STEnclosure

-(id) initWithManagedObject: (NSManagedObject *) object {
    self = [super init];
    if(self) {
        [self setLength:[object valueForKey:@"length"]];
        [self setType:[object valueForKey:@"type"]];
        [self setUrl:[object valueForKey:@"url"]];
    }
    return self;
}

@end
