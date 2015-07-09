//
// Created by Jan Schulte on 09/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STFeed.h"

@interface STFeed()
@property (readwrite, strong) NSString *address;
@end

@implementation STFeed

-(id) initWithAddress: (NSString *) address {
    self = [super init];
    if(self) {
        [self setAddress:address];
    }
    return self;
}

@end
